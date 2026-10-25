#include "BattlegroundAshran.h"
#include "BattlegroundMap.h"
#include "OutdoorPvP.h"
#include "OutdoorPvPMgr.h"
#include "Player.h"

namespace
{
    uint32 const EngineUpdateInterval = 1000;    // same pace as OutdoorPvPMgr gave the engines of the open world
}

BattlegroundAshran::BattlegroundAshran() : m_engineTimer(0)
{
}

OutdoorPvP* BattlegroundAshran::GetEngine() const
{
    BattlegroundMap* map = GetBgMap();
    return map ? map->GetOutdoorPvP() : nullptr;
}

void BattlegroundAshran::OnMapCreated()
{
    // made before the first grid is loaded: the creatures of the map look for the engine as they enter the world
    OutdoorPvP* engine = sOutdoorPvPMgr->CreateGameEngine(OUTDOOR_PVP_ASHRAN);
    if (!engine)
        return;

    BattlegroundMap* map = GetBgMap();
    map->SetOutdoorPvP(engine);
    engine->BindToGame(this, map);
}

void BattlegroundAshran::AddPlayer(Player* player)
{
    Battleground::AddPlayer(player);

    // the scoreboard and the kill counters read this entry
    if (PlayerScores.find(player->GetGUID()) == PlayerScores.end())
        PlayerScores[player->GetGUID()] = new BattlegroundAshranScore(player->GetGUID(), player->GetBGTeamId());

    if (OutdoorPvP* engine = GetEngine())
        engine->AddGamePlayer(player);
}

void BattlegroundAshran::RemovePlayer(Player* /*player*/, ObjectGuid guid, uint32 /*team*/)
{
    if (OutdoorPvP* engine = GetEngine())
        engine->RemoveGamePlayer(guid);
}

void BattlegroundAshran::StartingEventOpenDoors()
{
    if (OutdoorPvP* engine = GetEngine())
        engine->HandleGameStart();
}

void BattlegroundAshran::PostUpdateImpl(uint32 diff)
{
    // the engine stops with the game: nothing of the battle goes on once a side has won
    if (GetStatus() == STATUS_WAIT_LEAVE)
        return;

    OutdoorPvP* engine = GetEngine();
    if (!engine)
        return;

    // Runs in the thread of the base map, once the updates of its instances are done: nothing of the game moves
    // meanwhile, and the map does not update the engine (a map of a game holds no list of engines).
    m_engineTimer += diff;
    if (m_engineTimer < EngineUpdateInterval)
        return;

    engine->Update(m_engineTimer);
    m_engineTimer = 0;
}

void BattlegroundAshran::FillInitialWorldStates(WorldPackets::WorldState::InitWorldStates& packet)
{
    if (OutdoorPvP* engine = GetEngine())
        engine->FillInitialWorldStates(packet);
}

WorldSafeLocsEntry const* BattlegroundAshran::GetClosestGraveYard(Player* player)
{
    if (OutdoorPvP* engine = GetEngine())
        if (WorldSafeLocsEntry const* graveyard = engine->GetClosestGraveyard(player))
            return graveyard;

    return Battleground::GetClosestGraveYard(player);
}
