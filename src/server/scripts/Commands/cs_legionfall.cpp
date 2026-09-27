/*
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
Name: legionfall_commandscript
%Complete: 100
Comment: Legionfall buildings of the Broken Shore
Category: commandscripts
EndScriptData */

#include "ScriptMgr.h"
#include "Chat.h"
#include "ContributionMgr.h"
#include "DB2Stores.h"
#include "GameTime.h"
#include "Util.h"

using namespace ContributionData;

class legionfall_commandscript : public CommandScript
{
public:
    legionfall_commandscript() : CommandScript("legionfall_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> legionfallCommandTable =
        {
            { "info",           SEC_ADMINISTRATOR,  true,  &HandleLegionfallInfoCommand,       ""},
            { "state",          SEC_ADMINISTRATOR,  true,  &HandleLegionfallStateCommand,      ""},
            { "progress",       SEC_ADMINISTRATOR,  true,  &HandleLegionfallProgressCommand,   ""}
        };

        static std::vector<ChatCommand> commandTable =
        {
            { "legionfall",     SEC_ADMINISTRATOR,  true,  NULL,                  "", legionfallCommandTable }
        };
        return commandTable;
    }

    static char const* StateName(uint32 state)
    {
        switch (state)
        {
            case CONTRIBUTION_STATE_BUILDING:    return "building";
            case CONTRIBUTION_STATE_ACTIVE:      return "active";
            case CONTRIBUTION_STATE_UNDERATTACK: return "under attack";
            case CONTRIBUTION_STATE_DESTROYED:   return "destroyed";
            default:                             return "none";
        }
    }

    static uint32 ParseBuilding(char const* arg)
    {
        if (!arg)
            return 0;

        std::string name = arg;
        strToLower(name);
        if (name == "mage" || name == "1")
            return CONTRIBUTION_MAGE_TOWER;
        if (name == "command" || name == "3")
            return CONTRIBUTION_COMMAND_CENTER;
        if (name == "nether" || name == "4")
            return CONTRIBUTION_NETHER_DISRUPTOR;
        return 0;
    }

    static bool HandleLegionfallInfoCommand(ChatHandler* handler, char const* /*args*/)
    {
        uint32 const now = uint32(GameTime::GetGameTime());
        for (auto const& itr : sContributionMgr.GetContributions())
        {
            uint32 const id = itr.first;
            uint32 const next = sContributionMgr.GetNextChange(id);
            ManagedWorldStateEntry const* worldState = itr.second.WorldState;
            uint32 const state = sContributionMgr.GetState(id);
            uint32 const progress = sContributionMgr.GetProgress(id);
            uint32 const target = state == CONTRIBUTION_STATE_UNDERATTACK ? uint32(worldState->DepletionStateTargetValue) : uint32(worldState->AccumulationStateTargetValue);

            handler->PSendSysMessage("Building %u: %s, %u%%, built %u times, next change %s.", id, StateName(state),
                target ? uint32(uint64(progress) * 100 / target) : 0, sContributionMgr.GetOccurrences(id),
                next ? secsToTimeString(next > now ? next - now : 0, true).c_str() : "-");
        }
        return true;
    }

    static bool HandleLegionfallStateCommand(ChatHandler* handler, char const* args)
    {
        char* buildingArg = strtok((char*)args, " ");
        char* stateArg = strtok(nullptr, " ");
        uint32 const building = ParseBuilding(buildingArg);
        if (!building || !stateArg)
            return false;

        std::string stateName = stateArg;
        strToLower(stateName);
        ContributionState state = CONTRIBUTION_STATE_NONE;
        if (stateName == "building")
            state = CONTRIBUTION_STATE_BUILDING;
        else if (stateName == "active")
            state = CONTRIBUTION_STATE_ACTIVE;
        else if (stateName == "attack")
            state = CONTRIBUTION_STATE_UNDERATTACK;
        else if (stateName == "destroyed")
            state = CONTRIBUTION_STATE_DESTROYED;

        if (!sContributionMgr.SetState(building, state))
            return false;

        handler->PSendSysMessage("Building %u is now %s.", building, StateName(state));
        return true;
    }

    static bool HandleLegionfallProgressCommand(ChatHandler* handler, char const* args)
    {
        char* buildingArg = strtok((char*)args, " ");
        char* percentArg = strtok(nullptr, " ");
        uint32 const building = ParseBuilding(buildingArg);
        if (!building || !percentArg)
            return false;

        if (!isNumeric(percentArg))
            return false;

        uint32 const percent = uint32(atoi(percentArg));
        if (!sContributionMgr.SetProgress(building, percent))
        {
            handler->SendSysMessage("Only a building under construction takes a progress, from 0 to 100.");
            handler->SetSentErrorMessage(true);
            return false;
        }

        handler->PSendSysMessage("Building %u is %u%% built.", building, percent);
        return true;
    }
};

void AddSC_legionfall_commandscript()
{
    new legionfall_commandscript();
}
