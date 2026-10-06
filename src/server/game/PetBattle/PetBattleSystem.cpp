
#include "PetBattleSystem.h"
#include "PetBattle.h"
#include "Player.h"
#include "Position.h"
#include "ObjectAccessor.h"
#include "WorldSession.h"

#define PETBATTLE_DELETE_INTERVAL (1 * 30 * IN_MILLISECONDS)
#define PETBATTLE_LFB_INTERVAL 500
#define PETBATTLE_LFB_PROPOSAL_TIMEOUT (1 * MINUTE)
#define PETBATTLE_CREATION_TIMEOUT (2 * MINUTE * IN_MILLISECONDS)

struct PetBattleMembersPositions
{
    PetBattleMembersPositions(uint32 mapID, uint32 team, Position const& firstPosition, Position const& secondPosition) : MapID(mapID), Team(team)
    {
        Positions[0] = firstPosition;
        Positions[1] = secondPosition;
    }

    Position Positions[2];
    uint32 MapID;
    uint32 Team;
};

namespace
{
    // Matchmaking decisions are taken under _LFBRequestsMutex, then carried out once it is released.
    struct LFBAction
    {
        ObjectGuid PlayerGuid;
        ObjectGuid OpponentGuid;
        uint32 JoinTime = 0;
        uint32 TicketID = 0;
        uint32 Status = LFB_NONE;
        uint32 AvgWaitTime = 0;
        uint32 TeamID = 0;
        bool ProposeMatch = false;
        bool ReleaseJournal = false;
        bool StartMatch = false;
    };

    void PostQueueNotice(LFBAction const& action)
    {
        ObjectAccessor::PostToPlayer(action.PlayerGuid, [action](Player* player) -> void
        {
            WorldSession* session = player->GetSession();
            if (action.Status != LFB_NONE)
                session->SendPetBattleQueueStatus(action.JoinTime, action.TicketID, action.Status, action.AvgWaitTime);
            if (action.ProposeMatch)
                session->SendPetBattleQueueProposeMatch();
            if (action.ReleaseJournal)
                session->SendBattlePetJournalLockDenied();
        }, 0, ObjectAccessor::PlayerScope::InWorld);
    }

    // Undoes what a battle that never began left on the player (JoinMatchmakingBattle, DELAYED_PET_BATTLE_INITIAL),
    // in his own update; another battle he joined since is left alone.
    void ReleaseFromUnstartedBattle(ObjectGuid const& playerGuid, ObjectGuid const& battleID, bool matchmaking)
    {
        ObjectAccessor::PostToPlayer(playerGuid, [battleID, matchmaking](Player* player) -> void
        {
            if (player->_petBattleId != battleID)
                return;

            player->_petBattleId.Clear();
            player->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED | UNIT_FLAG_IMMUNE_TO_NPC);
            player->SetControlled(false, UNIT_STATE_ROOT);
            player->GetSession()->SendPetBattleFinished();
            player->GetSession()->SendBattlePetJournal();

            if (matchmaking)
                player->TeleportTo(player->m_recallLoc);
        });
    }

    // Runs in the player's own update: his journal is read and he is moved by his own thread.
    void JoinMatchmakingBattle(Player* player, std::shared_ptr<PetBattle> const& battle, uint32 teamID, uint32 mapID, Position const& position)
    {
        {
            std::lock_guard<std::recursive_mutex> guard(battle->BattleLock);
            if (battle->BattleStatus != PETBATTLE_STATUS_CREATION)
                return;

            auto petSlots = player->GetBattlePetCombatTeam();
            size_t petCount = 0;

            for (size_t i = 0; i < MAX_PETBATTLE_SLOTS; ++i)
            {
                if (!petSlots[i])
                    continue;

                if (petCount >= MAX_PETBATTLE_SLOTS || petCount >= player->GetUnlockedPetBattleSlot())
                    break;

                auto pet = std::make_shared<BattlePetInstance>();
                pet->CloneFrom(petSlots[i]);
                pet->Slot = petCount;
                pet->OriginalBattlePet = petSlots[i];
                battle->AddPet(teamID, pet);

                ++petCount;
            }
        }

        player->_petBattleId = battle->ID;
        player->SetBattlegroundEntryPoint();
        player->ScheduleDelayedOperation(DELAYED_PET_BATTLE_INITIAL);
        player->SaveRecallPosition();
        player->TeleportTo(mapID, position.GetPositionX() + 0.01f, position.GetPositionY() + 0.01f, position.GetPositionZ() + 0.01f, position.GetOrientation());
    }

    void StartMatchmakingBattle(ObjectGuid const& leftGuid, ObjectGuid const& rightGuid, uint32 teamID)
    {
        static PetBattleMembersPositions const gPetBattlePositions[7] =
        {
            PetBattleMembersPositions(0, TEAM_ALLIANCE, Position(-9502.376f, 114.492f, 59.822f), Position(-9493.934f, 119.854f, 58.459f)),
            PetBattleMembersPositions(0, TEAM_ALLIANCE, Position(-10048.859f, 1231.028f, 40.881f), Position(-10054.330f, 1239.399f, 40.894f)),
            PetBattleMembersPositions(0, TEAM_ALLIANCE, Position(-10909.911f, -362.280f, 39.643f), Position(-10899.923f, -362.773f, 39.265f)),
            PetBattleMembersPositions(0, TEAM_ALLIANCE, Position(-10439.142f, -1939.163f, 104.313f), Position(-10439.306f, -1949.162f, 103.763f)),

            PetBattleMembersPositions(1, TEAM_HORDE, Position(-954.766f, -3255.210f, 95.645f), Position(-958.212f, -3264.597f, 95.837f)),
            PetBattleMembersPositions(1, TEAM_HORDE, Position(-2285.038f, -2155.838f, 95.843f), Position(-2281.738f, -2146.397f, 95.843f)),
            //PetBattleMembersPositions(1, TEAM_HORDE, Position(-1369.247f, -2716.736f, 253.246f), Position(-1359.747f, -2713.613f, 253.390f)),
            PetBattleMembersPositions(1, TEAM_HORDE, Position(-127.255f, -4959.972f, 20.903f), Position(-129.017f, -4950.128f, 21.378f))
        };

        std::vector<PetBattleMembersPositions> positions;
        for (auto const& data : gPetBattlePositions)
            if (data.Team == teamID)
                positions.push_back(data);

        if (positions.empty())
            return;

        // Begin needs both players: a battle missing one would hold the other until the creation timeout
        if (!ObjectAccessor::IsPlayerOnline(leftGuid) || !ObjectAccessor::IsPlayerOnline(rightGuid))
            return;

        auto location = positions[urand(0, positions.size() - 1)];

        auto const& l_One = location.Positions[PETBATTLE_TEAM_1];
        auto const& l_Second = location.Positions[PETBATTLE_TEAM_2];
        float angle = atan2(l_Second.GetPositionY() - l_One.GetPositionY(), l_Second.GetPositionX() - l_One.GetPositionX());

        std::shared_ptr<PetBattle> battle = sPetBattleSystem->NewBattle();
        {
            std::lock_guard<std::recursive_mutex> guard(battle->BattleLock);

            battle->PvPMatchMakingRequest.LocationResult = 0;
            battle->PvPMatchMakingRequest.TeamPosition[PETBATTLE_TEAM_1] = location.Positions[0];
            battle->PvPMatchMakingRequest.TeamPosition[PETBATTLE_TEAM_2] = location.Positions[1];

            Position battleCenterPosition((location.Positions[0].GetPositionX() + location.Positions[1].GetPositionX()) / 2, (location.Positions[0].GetPositionY() + location.Positions[1].GetPositionY()) / 2, (location.Positions[0].GetPositionZ() + location.Positions[1].GetPositionZ()) / 2);
            battle->PvPMatchMakingRequest.PetBattleCenterPosition = battleCenterPosition;
            battle->PvPMatchMakingRequest.PetBattleCenterPosition.SetOrientation((angle >= 0) ? angle : 2 * M_PI + angle);

            battle->Teams[PETBATTLE_TEAM_1]->OwnerGuid = leftGuid;
            battle->Teams[PETBATTLE_TEAM_1]->PlayerGuid = leftGuid;
            battle->Teams[PETBATTLE_TEAM_2]->OwnerGuid = rightGuid;
            battle->Teams[PETBATTLE_TEAM_2]->PlayerGuid = rightGuid;

            battle->BattleType = PETBATTLE_TYPE_PVP_MATCHMAKING;
            battle->PvPMatchMakingRequest.IsPvPReady[PETBATTLE_TEAM_1] = false;
            battle->PvPMatchMakingRequest.IsPvPReady[PETBATTLE_TEAM_2] = false;
        }

        // Each player adds his own pets from his own thread; Begin waits for both (DELAYED_PET_BATTLE_INITIAL).
        Position teamPositions[MAX_PETBATTLE_TEAM] = { location.Positions[PETBATTLE_TEAM_1], location.Positions[PETBATTLE_TEAM_2] };
        teamPositions[PETBATTLE_TEAM_1].SetOrientation(angle);
        teamPositions[PETBATTLE_TEAM_2].SetOrientation(angle + float(M_PI));

        ObjectGuid const guids[MAX_PETBATTLE_TEAM] = { leftGuid, rightGuid };
        uint32 const mapID = location.MapID;
        for (uint32 teamIdx = 0; teamIdx < MAX_PETBATTLE_TEAM; ++teamIdx)
        {
            Position const position = teamPositions[teamIdx];
            ObjectAccessor::PostToPlayer(guids[teamIdx], [battle, teamIdx, mapID, position](Player* player) -> void
            {
                JoinMatchmakingBattle(player, battle, teamIdx, mapID, position);
            }, 0, ObjectAccessor::PlayerScope::InWorld);
        }
    }
}

PetBattleSystem::PetBattleSystem()
{
    _maxPetBattleID = 1;
    _deleteUpdateTimer.SetInterval(PETBATTLE_DELETE_INTERVAL);
    _LFBAvgWaitTime = 0;
    _LFBNumWaitTimeAvg = 0;
    _LFBRequestsUpdateTimer.SetInterval(PETBATTLE_LFB_INTERVAL);
}

PetBattleSystem::~PetBattleSystem()
{
    for (auto& itr : _LFBRequests)
        delete itr.second;
}

PetBattleSystem* PetBattleSystem::instance()
{
    static PetBattleSystem instance;
    return &instance;
}

std::shared_ptr<PetBattle> PetBattleSystem::NewBattle()
{
    auto battle = std::make_shared<PetBattle>();
    battle->ID = ObjectGuid::Create<HighGuid::PetBattle>(++_maxPetBattleID);

    std::lock_guard<std::mutex> guard(_lock);
    _petBattles[battle->ID] = battle;
    return battle;
}

std::shared_ptr<PetBattle> PetBattleSystem::AcquireBattle(ObjectGuid battleID)
{
    std::lock_guard<std::mutex> guard(_lock);
    auto itr = _petBattles.find(battleID);
    return itr != _petBattles.end() ? itr->second : nullptr;
}

PetBattle* PetBattleSystem::CreateBattle()
{
    return NewBattle().get();
}

PetBattle* PetBattleSystem::GetBattle(ObjectGuid battleID)
{
    return AcquireBattle(battleID).get();
}

PetBattleRequest* PetBattleSystem::CreateRequest(ObjectGuid requesterGuid)
{
    auto request = std::make_shared<PetBattleRequest>();
    request->RequesterGuid = requesterGuid;

    std::lock_guard<std::mutex> guard(_lock);
    // A new request replaces the previous one of the same player.
    _battleRequests[requesterGuid] = request;
    return request.get();
}

void PetBattleSystem::AddRequest(std::shared_ptr<PetBattleRequest> const& request)
{
    std::lock_guard<std::mutex> guard(_lock);
    _battleRequests[request->RequesterGuid] = request;
}

std::shared_ptr<PetBattleRequest> PetBattleSystem::GetRequest(ObjectGuid requesterGuid)
{
    std::lock_guard<std::mutex> guard(_lock);
    auto itr = _battleRequests.find(requesterGuid);
    return itr != _battleRequests.end() ? itr->second : nullptr;
}

std::shared_ptr<PetBattleRequest> PetBattleSystem::TakeRequest(ObjectGuid requesterGuid, ObjectGuid opponentGuid)
{
    std::lock_guard<std::mutex> guard(_lock);
    auto itr = _battleRequests.find(requesterGuid);
    if (itr == _battleRequests.end() || !itr->second || itr->second->OpponentGuid != opponentGuid)
        return nullptr;

    std::shared_ptr<PetBattleRequest> request = std::move(itr->second);
    _battleRequests.erase(itr);
    return request;
}

void PetBattleSystem::RemoveBattle(ObjectGuid battleID)
{
    std::shared_ptr<PetBattle> battle;
    {
        std::lock_guard<std::mutex> guard(_lock);
        auto itr = _petBattles.find(battleID);
        if (itr == _petBattles.end())
            return;

        battle = std::move(itr->second);
        _petBattles.erase(itr);
    }
}

void PetBattleSystem::RemoveRequest(ObjectGuid requesterGuid)
{
    std::lock_guard<std::mutex> guard(_lock);
    _battleRequests.erase(requesterGuid);
}

void PetBattleSystem::JoinQueue(Player* player)
{
    /// Pandaren case
    if (player->GetTeamId() == TEAM_NEUTRAL)
    {
        player->GetSession()->SendPetBattleQueueStatus(0, 1, LFBUpdateStatus::LFB_CANT_JOIN_DUE_TO_UNSELECTED_FACTION, 0);
        return;
    }

    // Load player pets
    auto petSlots = player->GetBattlePetCombatTeam();
    uint32 weight = 0;

    for (size_t i = 0; i < MAX_PETBATTLE_SLOTS; ++i)
        if (petSlots[i])
            weight += petSlots[i]->Level;

    uint32 joinTime = 0;
    uint32 ticketID = 0;
    uint32 avgWaitTime = 0;
    {
        std::lock_guard<std::mutex> l_Lock(_LFBRequestsMutex);

        auto itr = _LFBRequests.find(player->GetGUID());
        if (itr != _LFBRequests.end() && itr->second != nullptr)
            return;

        auto ticket = new LFBTicket();
        ticket->State = LFBState::LFB_STATE_QUEUED;
        ticket->JoinTime = GameTime::GetGameTime();
        ticket->TicketID = 1;
        ticket->MatchingOpponent = nullptr;
        ticket->ProposalAnswer = LFBAnswer::LFB_ANSWER_PENDING;
        ticket->Weight = weight;
        ticket->RequesterGUID = player->GetGUID();
        ticket->TeamID = player->GetTeamId();

        _LFBRequests[player->GetGUID()] = ticket;

        joinTime = ticket->JoinTime;
        ticketID = ticket->TicketID;
        avgWaitTime = _LFBAvgWaitTime;
    }

    player->GetSession()->SendBattlePetJournalLockAcquired();
    player->GetSession()->SendPetBattleQueueStatus(joinTime, ticketID, LFBUpdateStatus::LFB_JOIN_QUEUE, avgWaitTime);
}

void PetBattleSystem::ProposalResponse(Player* player, bool accepted)
{
    std::lock_guard<std::mutex> l_Lock(_LFBRequestsMutex);

    auto itr = _LFBRequests.find(player->GetGUID());
    if (itr == _LFBRequests.end() || itr->second == nullptr)
        return;

    auto ticket = itr->second;
    if (ticket->State != LFBState::LFB_STATE_PROPOSAL)
        return;

    ticket->ProposalAnswer = accepted ? LFBAnswer::LFB_ANSWER_AGREE : LFBAnswer::LFB_ANSWER_DENY;
}

void PetBattleSystem::LeaveQueue(Player* player)
{
    LFBAction opponentNotice;
    bool notifyOpponent = false;
    bool left = false;
    uint32 joinTime = 0;
    uint32 ticketID = 0;
    uint32 avgWaitTime = 0;
    {
        std::lock_guard<std::mutex> l_Lock(_LFBRequestsMutex);

        auto itr = _LFBRequests.find(player->GetGUID());
        if (itr == _LFBRequests.end() || !itr->second)
            return;

        auto ticket = itr->second;
        switch (ticket->State)
        {
            case LFBState::LFB_STATE_PROPOSAL:
            {
                if (ticket->MatchingOpponent)
                {
                    ticket->MatchingOpponent->MatchingOpponent = nullptr;
                    ticket->MatchingOpponent->State = LFBState::LFB_STATE_QUEUED;

                    opponentNotice.PlayerGuid = ticket->MatchingOpponent->RequesterGUID;
                    opponentNotice.JoinTime = ticket->MatchingOpponent->JoinTime;
                    opponentNotice.TicketID = ticket->MatchingOpponent->TicketID;
                    opponentNotice.Status = LFBUpdateStatus::LFB_JOIN_QUEUE;
                    opponentNotice.AvgWaitTime = _LFBAvgWaitTime;
                    notifyOpponent = true;
                }

                /// Continue to other case handlers
            }
            case LFBState::LFB_STATE_FINISHED:
            case LFBState::LFB_STATE_IN_COMBAT:
            case LFBState::LFB_STATE_QUEUED:
            {
                joinTime = ticket->JoinTime;
                ticketID = ticket->TicketID;
                avgWaitTime = _LFBAvgWaitTime;
                left = true;

                delete ticket;
                itr->second = nullptr;
                break;
            }
            default:
                break;
        }
    }

    // The opponent may be updated by another map thread.
    if (notifyOpponent)
        PostQueueNotice(opponentNotice);

    if (left)
    {
        player->GetSession()->SendPetBattleQueueStatus(joinTime, ticketID, LFBUpdateStatus::LFB_LEAVE_QUEUE, avgWaitTime);
        player->GetSession()->SendBattlePetJournalLockDenied();
        player->UpdateBattlePetCombatTeam();
    }
}

void PetBattleSystem::Update(uint32 diff)
{
    _deleteUpdateTimer.Update(diff);
    _LFBRequestsUpdateTimer.Update(diff);

    if (_deleteUpdateTimer.Passed())
    {
        _deleteUpdateTimer.Reset();

        // Destroyed after the lock is released; a battle still held by a pending player event lives on.
        std::vector<std::shared_ptr<PetBattle>> erased;
        {
            std::lock_guard<std::mutex> guard(_lock);

            // A battle waits one full interval in the pending list, so a raw GetBattle() pointer taken
            // just before it ended is not freed under its user.
            for (ObjectGuid const& battleID : _deleteQueueReady)
            {
                auto itr = _petBattles.find(battleID);
                if (itr == _petBattles.end())
                    continue;

                erased.push_back(std::move(itr->second));
                _petBattles.erase(itr);
            }

            _deleteQueueReady.swap(_deleteQueuePending);
            _deleteQueuePending.clear();
        }
    }

    std::vector<std::shared_ptr<PetBattle>> battles;
    {
        std::lock_guard<std::mutex> guard(_lock);
        battles.reserve(_petBattles.size());
        for (auto const& itr : _petBattles)
            if (itr.second)
                battles.push_back(itr.second);
    }

    struct UnstartedRelease
    {
        ObjectGuid BattleID;
        ObjectGuid PlayerGuids[MAX_PETBATTLE_TEAM];
        bool Matchmaking;
    };

    std::vector<ObjectGuid> finished;
    std::vector<UnstartedRelease> unstarted;
    for (auto const& battle : battles)
    {
        std::lock_guard<std::recursive_mutex> guard(battle->BattleLock);

        if (battle->BattleStatus == PETBATTLE_STATUS_RUNNING)
            battle->Update(diff);
        else if (battle->BattleStatus == PETBATTLE_STATUS_FINISHED)
        {
            battle->BattleStatus = PETBATTLE_STATUS_PENDING_DELETE;
            finished.push_back(battle->ID);
        }
        else if (battle->BattleStatus == PETBATTLE_STATUS_CREATION)
        {
            // A player gone before joining (logout, skipped JoinMatchmakingBattle) leaves the other one rooted
            // in a battle that never begins: give up, the next pass queues it for deletion
            battle->CreationElapsed += diff;
            if (battle->CreationElapsed >= PETBATTLE_CREATION_TIMEOUT)
            {
                battle->BattleStatus = PETBATTLE_STATUS_FINISHED;
                unstarted.push_back({ battle->ID, { battle->Teams[PETBATTLE_TEAM_1]->PlayerGuid, battle->Teams[PETBATTLE_TEAM_2]->PlayerGuid },
                    battle->BattleType == PETBATTLE_TYPE_PVP_MATCHMAKING });
            }
        }
    }

    for (UnstartedRelease const& release : unstarted)
        for (ObjectGuid const& playerGuid : release.PlayerGuids)
            if (!playerGuid.IsEmpty())
                ReleaseFromUnstartedBattle(playerGuid, release.BattleID, release.Matchmaking);

    if (!finished.empty())
    {
        std::lock_guard<std::mutex> guard(_lock);
        _deleteQueuePending.insert(_deleteQueuePending.end(), finished.begin(), finished.end());
    }

    if (_LFBRequestsUpdateTimer.Passed())
    {
        _LFBRequestsUpdateTimer.Reset();
        UpdateQueue();
    }
}

void PetBattleSystem::UpdateQueue()
{
    std::vector<LFBAction> actions;

    {
        std::lock_guard<std::mutex> l_Lock(_LFBRequestsMutex);
        std::vector<ObjectGuid> ticketsToRemove;

        auto notify = [this, &actions](ObjectGuid const& target, LFBTicket const* ticket, uint32 status) -> LFBAction&
        {
            actions.emplace_back();
            LFBAction& action = actions.back();
            action.PlayerGuid = target;
            action.JoinTime = ticket->JoinTime;
            action.TicketID = ticket->TicketID;
            action.Status = status;
            action.AvgWaitTime = _LFBAvgWaitTime;
            return action;
        };

        for (auto pair : _LFBRequests)
        {
            auto ticket = pair.second;
            if (!ticket)
            {
                ticketsToRemove.push_back(pair.first);
                continue;
            }

            if (std::find(ticketsToRemove.begin(), ticketsToRemove.end(), ticket->RequesterGUID) != ticketsToRemove.end())
                continue;

            auto queuedTime = uint32(GameTime::GetGameTime() - ticket->JoinTime);
            auto oldNumber = _LFBNumWaitTimeAvg++;
            _LFBAvgWaitTime = int32((_LFBAvgWaitTime * oldNumber + queuedTime) / _LFBNumWaitTimeAvg);

            switch (ticket->State)
            {
                case LFBState::LFB_STATE_QUEUED:
                {
                    if (ObjectAccessor::IsPlayerOnline(ticket->RequesterGUID))
                    {
                        notify(ticket->RequesterGUID, ticket, LFBUpdateStatus::LFB_UPDATE_STATUS);

                        std::vector<LFBTicket*> possibleOpponent;
                        for (auto v : _LFBRequests)
                        {
                            auto secondTicket = v.second;

                            if (!secondTicket || secondTicket->State != LFBState::LFB_STATE_QUEUED || secondTicket->TeamID != ticket->TeamID || abs(static_cast<int>(secondTicket->Weight - ticket->Weight)) > 5)
                                continue;

                            if (secondTicket->RequesterGUID == ticket->RequesterGUID)
                                continue;

                            if (!ObjectAccessor::IsPlayerOnline(secondTicket->RequesterGUID))
                                continue;

                            possibleOpponent.push_back(secondTicket);
                        }

                        // Strict order: std::sort with >= is undefined behaviour.
                        std::sort(possibleOpponent.begin(), possibleOpponent.end(), [](LFBTicket const* a, LFBTicket const* b)
                        {
                            return a->Weight > b->Weight;
                        });

                        if (!possibleOpponent.empty())
                        {
                            auto l_Left = ticket;
                            auto l_Right = possibleOpponent[0];

                            l_Left->MatchingOpponent = l_Right;
                            l_Right->MatchingOpponent = l_Left;

                            l_Left->State = LFBState::LFB_STATE_PROPOSAL;
                            l_Right->State = LFBState::LFB_STATE_PROPOSAL;

                            l_Left->ProposalTime = GameTime::GetGameTime();
                            l_Right->ProposalTime = GameTime::GetGameTime();

                            notify(l_Left->RequesterGUID, l_Left, LFBUpdateStatus::LFB_PROPOSAL_BEGIN).ProposeMatch = true;
                            notify(l_Right->RequesterGUID, l_Right, LFBUpdateStatus::LFB_PROPOSAL_BEGIN).ProposeMatch = true;
                        }
                    }
                    else
                        ticketsToRemove.push_back(ticket->RequesterGUID);
                    break;
                }
                case LFBState::LFB_STATE_PROPOSAL:
                {
                    auto l_Left = ticket;
                    auto l_Right = ticket->MatchingOpponent;
                    if (!l_Right)
                    {
                        ticketsToRemove.push_back(l_Left->RequesterGUID);
                        break;
                    }

                    bool const bothOnline = ObjectAccessor::IsPlayerOnline(l_Left->RequesterGUID) && ObjectAccessor::IsPlayerOnline(l_Right->RequesterGUID);

                    /// Enter in combat
                    if (l_Left->ProposalAnswer == LFBAnswer::LFB_ANSWER_AGREE && l_Right->ProposalAnswer == LFBAnswer::LFB_ANSWER_AGREE)
                    {
                        if (bothOnline)
                        {
                            notify(l_Left->RequesterGUID, l_Left, LFBUpdateStatus::LFB_PET_BATTLE_IS_STARTED);
                            notify(l_Right->RequesterGUID, l_Right, LFBUpdateStatus::LFB_PET_BATTLE_IS_STARTED);

                            l_Left->State = LFBState::LFB_STATE_IN_COMBAT;
                            l_Right->State = LFBState::LFB_STATE_IN_COMBAT;

                            actions.emplace_back();
                            LFBAction& match = actions.back();
                            match.StartMatch = true;
                            match.PlayerGuid = l_Left->RequesterGUID;
                            match.OpponentGuid = l_Right->RequesterGUID;
                            match.TeamID = l_Left->TeamID;

                            ticketsToRemove.push_back(l_Left->RequesterGUID);
                            ticketsToRemove.push_back(l_Right->RequesterGUID);
                        }
                    }
                    /// Someone declined
                    else if (l_Left->ProposalAnswer == LFBAnswer::LFB_ANSWER_DENY || l_Right->ProposalAnswer == LFBAnswer::LFB_ANSWER_DENY)
                    {
                        bool p_LeftRemoved = false;
                        bool p_RightRemoved = false;

                        if (bothOnline)
                        {
                            if (l_Left->ProposalAnswer == LFBAnswer::LFB_ANSWER_DENY)
                            {
                                notify(l_Right->RequesterGUID, l_Left, LFBUpdateStatus::LFB_OPPONENT_PROPOSAL_DECLINED);
                                ticketsToRemove.push_back(l_Left->RequesterGUID);
                                p_LeftRemoved = true;
                            }

                            if (l_Right->ProposalAnswer == LFBAnswer::LFB_ANSWER_DENY)
                            {
                                notify(l_Left->RequesterGUID, l_Left, LFBUpdateStatus::LFB_OPPONENT_PROPOSAL_DECLINED);
                                ticketsToRemove.push_back(l_Right->RequesterGUID);
                                p_RightRemoved = true;
                            }

                            if (!p_LeftRemoved)
                            {
                                l_Left->State = LFBState::LFB_STATE_QUEUED;
                                notify(l_Left->RequesterGUID, l_Left, LFBUpdateStatus::LFB_JOIN_QUEUE);
                            }
                            if (!p_RightRemoved)
                            {
                                l_Right->State = LFBState::LFB_STATE_QUEUED;
                                notify(l_Right->RequesterGUID, l_Right, LFBUpdateStatus::LFB_JOIN_QUEUE);
                            }
                        }
                    }
                    /// Proposal expired
                    if ((GameTime::GetGameTime() - ticket->ProposalTime) > PETBATTLE_LFB_PROPOSAL_TIMEOUT)
                    {
                        l_Left->MatchingOpponent = nullptr;
                        l_Right->MatchingOpponent = nullptr;

                        ticketsToRemove.push_back(l_Left->RequesterGUID);
                        ticketsToRemove.push_back(l_Right->RequesterGUID);
                    }

                    break;
                }
                default:
                    break;
            }
        }

        for (auto& guid : ticketsToRemove)
        {
            auto itr = _LFBRequests.find(guid);
            if (itr == _LFBRequests.end())
                continue;

            auto ticket = itr->second;
            if (!ticket)
            {
                _LFBRequests.erase(itr);
                continue;
            }

            switch (ticket->State)
            {
                case LFBState::LFB_STATE_PROPOSAL:
                {
                    if (ticket->MatchingOpponent)
                    {
                        ticket->MatchingOpponent->MatchingOpponent = nullptr;
                        ticket->MatchingOpponent->State = LFBState::LFB_STATE_QUEUED;

                        notify(ticket->MatchingOpponent->RequesterGUID, ticket->MatchingOpponent, LFBUpdateStatus::LFB_JOIN_QUEUE);
                    }

                    /// Continue to other case handlers
                }
                case LFBState::LFB_STATE_FINISHED:
                case LFBState::LFB_STATE_IN_COMBAT:
                case LFBState::LFB_STATE_QUEUED:
                {
                    notify(guid, ticket, LFBUpdateStatus::LFB_LEAVE_QUEUE).ReleaseJournal = true;

                    delete ticket;
                    itr->second = nullptr;
                    break;
                }
                default:
                    break;
            }
        }
    }

    // Carried out in decision order once the queue lock is released; players are reached through their own update.
    for (LFBAction const& action : actions)
    {
        if (action.StartMatch)
            StartMatchmakingBattle(action.PlayerGuid, action.OpponentGuid, action.TeamID);
        else
            PostQueueNotice(action);
    }
}

void PetBattleSystem::ForfeitBattle(ObjectGuid battleID, ObjectGuid forfeiterGuid, bool ignoreAbandonPenalty)
{
    if (std::shared_ptr<PetBattle> battle = AcquireBattle(battleID))
        battle->Forfeit(forfeiterGuid, ignoreAbandonPenalty);
}

eBattlePetRequests PetBattleSystem::CanPlayerEnterInPetBattle(Player* player, PetBattleRequest* petBattleRequest)
{
    if (!player || !player->IsInWorld())
        return PETBATTLE_REQUEST_CREATE_FAILED;

    if (player->isDead())
        return PETBATTLE_REQUEST_NOT_WHILE_DEAD;

    // Player can't be already in battle
    if (player->_petBattleId)
        return PETBATTLE_REQUEST_IN_BATTLE;

    if (petBattleRequest->OpponentGuid.IsPlayer())
    {
        // Only a player of the same map belongs to this thread.
        auto player2 = ObjectAccessor::GetPlayer(*player, petBattleRequest->OpponentGuid);
        if (!player2 && ObjectAccessor::IsPlayerOnline(petBattleRequest->OpponentGuid))
            return PETBATTLE_REQUEST_TARGET_OUT_OF_RANGE;

        if (player2)
        {

            if (player2->_petBattleId)
                return PETBATTLE_REQUEST_IN_BATTLE;

            if (!player->IsWithinDist3d(player2, 10.0f))   // the client offers a pet duel at duel range, not at interaction range
                return PETBATTLE_REQUEST_TARGET_OUT_OF_RANGE;

            if (!player->IsWithinLOSInMap(player2))
                return PETBATTLE_REQUEST_NOT_HERE_OBSTRUCTED;
        }
    }
    else if (petBattleRequest->OpponentGuid.IsCreature())
    {
        auto creature = player->GetNPCIfCanInteractWith(petBattleRequest->OpponentGuid, 0);
        if (!creature)
            return PETBATTLE_REQUEST_TARGET_INVALID;

        if (creature->_petBattleId)
            return PETBATTLE_REQUEST_WILD_PET_TAPPED;

        if (!player->IsWithinDist3d(creature, INTERACTION_DISTANCE))
            return PETBATTLE_REQUEST_TARGET_OUT_OF_RANGE;

        if (!player->IsWithinLOSInMap(creature))
            return PETBATTLE_REQUEST_NOT_HERE_OBSTRUCTED;
    }

    if (player->isInCombat())
        return PETBATTLE_REQUEST_NOT_WHILE_IN_COMBAT;

    // Check positions
    for (const auto& itr : petBattleRequest->TeamPosition)
        if (player->GetMap()->getObjectHitPos(player->GetPhases(), true, petBattleRequest->PetBattleCenterPosition, itr, 0.0f))
            return PETBATTLE_REQUEST_NOT_HERE_UNEVEN_GROUND;

    auto petSlots = player->GetBattlePetCombatTeam();
    size_t playerPetCount = 0;
    size_t playerDeadPetCount = 0;

    for (size_t i = 0; i < MAX_PETBATTLE_SLOTS; ++i)
    {
        if (!petSlots[i])
            continue;

        if (playerPetCount >= MAX_PETBATTLE_SLOTS || playerPetCount >= player->GetUnlockedPetBattleSlot())
            break;

        if (petSlots[i]->Health < 1)
            playerDeadPetCount++;

        ++playerPetCount;
    }

    if (!playerPetCount)
        return PETBATTLE_REQUEST_NO_PETS_IN_SLOT;

    if (playerPetCount == playerDeadPetCount)
        return PETBATTLE_REQUEST_ALL_PETS_DEAD;

    return PETBATTLE_REQUEST_OK;
}

