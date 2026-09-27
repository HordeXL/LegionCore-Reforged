/*
Created by d7561985@gmail.com
*/
#pragma once

#ifndef ContributionMgr_h__
#define ContributionMgr_h__

#include "Define.h"
#include <map>
#include <mutex>

class Player;
struct ContributionEntry;
struct ManagedWorldStateEntry;
struct ManagedWorldStateInputEntry;

namespace ContributionData
{
    enum ContributionState : uint8
    {
        CONTRIBUTION_STATE_NONE = 0,
        CONTRIBUTION_STATE_BUILDING = 1,
        CONTRIBUTION_STATE_ACTIVE = 2,
        CONTRIBUTION_STATE_UNDERATTACK = 3,
        CONTRIBUTION_STATE_DESTROYED = 4
    };

    enum ContributionResult : uint8
    {
        CONTRIBUTUIN_RESULT_SUCCESS = 0,
        CONTRIBUTUIN_RESULT_MUST_BE_NEAR = 1,
        CONTRIBUTUIN_RESULT_INCORRECT_STATE = 2,
        CONTRIBUTUIN_RESULT_INVALID_ID = 3,
        CONTRIBUTUIN_RESULT_QUEST_DATA_MISSING = 4,
        CONTRIBUTUIN_RESULT_FAILED_CONDITION_CHECK = 5,
        CONTRIBUTUIN_RESULT_UNABLE_TO_COMPLETE_TURN_IN = 6,
        CONTRIBUTUIN_RESULT_INTERNAL_ERROR = 7
    };

    enum Contribution : uint8
    {
        CONTRIBUTION_MAGE_TOWER = 1,
        CONTRIBUTION_COMMAND_CENTER = 3,
        CONTRIBUTION_NETHER_DISRUPTOR = 4,
    };
}

// A Legionfall building of the Broken Shore. Its stage, progress and number of completed constructions live in the
// world states named by ManagedWorldState: the client reads them to draw the construction table and the map.
// Building fills the progress with contributions; Active lasts UpTimeSecs; Under Attack drains the progress by
// DepletionAmountPerMinute; Destroyed lasts DownTimeSecs, then building starts again.
struct ContributionLifeData
{
    ContributionEntry const* Contribution = nullptr;
    ManagedWorldStateEntry const* WorldState = nullptr;
    ManagedWorldStateInputEntry const* Input = nullptr;
    uint32 LastChange = 0;      // unix time of the last stage change
};

class ContributionMgr
{
public:
    static ContributionMgr& Instance();

    void Initialize();
    void Update(uint32 diff);

    void Contribute(Player* player, uint32 orderIndex);
    void OnCreatureDeath(uint32 entry, uint32 respawnTime);     // Broken Isles creatures only
    void SendLastChange(Player* player, uint32 contributionID, uint32 requestGuid);

    ContributionData::ContributionState GetState(uint32 contributionID) const;
    uint32 GetProgress(uint32 contributionID) const;
    uint32 GetOccurrences(uint32 contributionID) const;
    uint32 GetNextChange(uint32 contributionID) const;     // unix time, 0 while building
    std::map<uint32, ContributionLifeData> const& GetContributions() const { return _contributions; }

    // GM commands
    bool SetState(uint32 contributionID, ContributionData::ContributionState state);
    bool SetProgress(uint32 contributionID, uint32 percent);

private:
    bool IsOpen() const;
    bool IsAlwaysBuilt(ContributionLifeData const& data) const;
    uint32 GetValue(int32 worldStateID) const;
    void SetValue(int32 worldStateID, uint32 value);
    void ChangeState(ContributionLifeData& data, ContributionData::ContributionState state, uint32 now);
    void SendResult(Player* player, uint32 contributionID, ContributionData::ContributionResult result) const;

    std::map<uint32, ContributionLifeData> _contributions;     // by Contribution ID
    std::map<uint32, uint32> _rareRespawn;                      // Broken Shore rare entry -> respawn time, 0 when up
    uint32 _updateTimer = 0;
    mutable std::recursive_mutex _lock;
};

#define sContributionMgr ContributionMgr::Instance()

#endif // ContributionMgr_h__
