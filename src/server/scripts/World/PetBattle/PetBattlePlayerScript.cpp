////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "PetBattle.h"
#include "Common.h"
#include "PetBattleSystem.h"

class PlayerScriptPetBattle : public PlayerScript
{
public:
    PlayerScriptPetBattle() : PlayerScript("PlayerScriptPetBattle") { }

    void OnMovementInform(Player* player, uint32 mveType, uint32 id) override
    {
        if (player && mveType == POINT_MOTION_TYPE && id == PETBATTLE_ENTER_MOVE_SPLINE_ID)
        {
            m_Mutex.lock();
            m_DelayedPetBattleStart[player->GetGUID()] = getMSTime() + 1000;
            m_Mutex.unlock();
        }
    }

    void OnUpdate(Player* player, uint32 /*diff*/) override
    {
        // decided under the script mutex (shared by every player thread), acted on after releasing it
        bool start = false;
        {
            std::lock_guard<std::mutex> guard(m_Mutex);
            auto itr = m_DelayedPetBattleStart.find(player->GetGUID());
            if (itr != m_DelayedPetBattleStart.end() && getMSTime() >= itr->second)   // the battle starts 1 s after the move ends
            {
                m_DelayedPetBattleStart.erase(itr);
                start = true;
            }
        }

        if (!start)
            return;

        if (std::shared_ptr<PetBattle> battle = sPetBattleSystem->AcquireBattle(player->_petBattleId))
        {
            std::lock_guard<std::recursive_mutex> battleGuard(battle->BattleLock);
            player->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED | UNIT_FLAG_IMMUNE_TO_NPC); // Immuned only to NPC
            player->SetControlled(true, UNIT_STATE_ROOT);
            battle->Begin(player);
        }
    }

    std::map<ObjectGuid, uint32> m_DelayedPetBattleStart;
    std::mutex m_Mutex;
};

void AddSC_PetBattlePlayerScript()
{
    new PlayerScriptPetBattle;
}
