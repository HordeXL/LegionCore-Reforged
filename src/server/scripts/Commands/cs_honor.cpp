/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 *
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
Name: honor_commandscript
%Complete: 100
Comment: All honor related commands
Category: commandscripts
EndScriptData */

#include "ScriptMgr.h"
#include "Chat.h"
#include "DatabaseEnv.h"
#include "Util.h"
#include "World.h"

class honor_commandscript : public CommandScript
{
public:
    honor_commandscript() : CommandScript("honor_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> honorAddCommandTable =
        {
            { "kill",           SEC_GAMEMASTER,     false, &HandleHonorAddKillCommand,         ""},
            { "",               SEC_GAMEMASTER,     false, &HandleHonorAddCommand,             ""}
        };

        static std::vector<ChatCommand> honorCommandTable =
        {
            { "add",            SEC_GAMEMASTER,     false, NULL,               "", honorAddCommandTable },
            { "update",         SEC_GAMEMASTER,     false, &HandleHonorUpdateCommand,          ""}
        };

        static std::vector<ChatCommand> pvpSeasonCommandTable =
        {
            { "info",           SEC_ADMINISTRATOR,  true,  &HandlePvPSeasonInfoCommand,        ""},
            { "reset",          SEC_ADMINISTRATOR,  true,  &HandlePvPSeasonResetCommand,       ""},
            { "restore",        SEC_ADMINISTRATOR,  true,  &HandlePvPSeasonRestoreCommand,     ""},
            { "cancel",         SEC_ADMINISTRATOR,  true,  &HandlePvPSeasonCancelCommand,      ""}
        };

        static std::vector<ChatCommand> commandTable =
        {
            { "honor",          SEC_GAMEMASTER,     false, NULL,                  "", honorCommandTable },
            { "pvpseason",      SEC_ADMINISTRATOR,  true,  NULL,                  "", pvpSeasonCommandTable }
        };
        return commandTable;
    }

    static bool HandleHonorAddCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;

        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendSysMessage(LANG_PLAYER_NOT_FOUND);
            handler->SetSentErrorMessage(true);
            return false;
        }

        // check online security
        if (handler->HasLowerSecurity(target, ObjectGuid::Empty))
            return false;

        uint32 amount = (uint32)atoi(args);
        target->RewardHonor(NULL, 1, amount);
        return true;
    }

    static bool HandleHonorAddKillCommand(ChatHandler* handler, char const* /*args*/)
    {
        Unit* target = handler->getSelectedUnit();
        if (!target)
        {
            handler->SendSysMessage(LANG_PLAYER_NOT_FOUND);
            handler->SetSentErrorMessage(true);
            return false;
        }

        // check online security
        if (target->GetTypeId() == TYPEID_PLAYER && handler->HasLowerSecurity((Player*)target, ObjectGuid::Empty))
            return false;

        handler->GetSession()->GetPlayer()->RewardHonor(target, 1);
        return true;
    }

    static bool HandleHonorUpdateCommand(ChatHandler* handler, char const* /*args*/)
    {
        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendSysMessage(LANG_PLAYER_NOT_FOUND);
            handler->SetSentErrorMessage(true);
            return false;
        }

        // check online security
        if (handler->HasLowerSecurity(target, ObjectGuid::Empty))
            return false;

        target->UpdateHonorFields();
        return true;
    }

    static bool HandlePvPSeasonInfoCommand(ChatHandler* handler, char const* /*args*/)
    {
        handler->PSendSysMessage("PvP season %u, top rating steps %s.", sWorld->getIntConfig(CONFIG_PVP_ACTIVE_SEASON),
            sWorld->getIntConfig(CONFIG_PVP_ACTIVE_STEP) ? "open" : "closed");

        if (QueryResult saves = CharacterDatabase.Query("SELECT season, COUNT(*), MAX(archived) FROM character_brackets_info_season GROUP BY season ORDER BY season"))
        {
            do
            {
                Field* fields = saves->Fetch();
                handler->PSendSysMessage("Saved season %u: %u ratings, %s.", fields[0].GetUInt8(), uint32(fields[1].GetUInt64()),
                    TimeToTimestampStr(time_t(fields[2].GetUInt32())).c_str());
            }
            while (saves->NextRow());
        }
        else
            handler->SendSysMessage("No season saved.");

        switch (sWorld->getWorldState(WS_PVP_SEASON_PENDING))
        {
            case PVP_SEASON_PENDING_RESET: handler->SendSysMessage("At the next start: save, then reset."); break;
            case PVP_SEASON_PENDING_RESTORE: handler->SendSysMessage("At the next start: back to the save."); break;
            default: break;
        }
        return true;
    }

    static bool HandlePvPSeasonResetCommand(ChatHandler* handler, char const* /*args*/)
    {
        sWorld->setWorldState(WS_PVP_SEASON_PENDING, PVP_SEASON_PENDING_RESET);
        handler->PSendSysMessage("At the next start, the ratings of season %u will be saved, then reset. .pvpseason cancel to undo.",
            sWorld->getIntConfig(CONFIG_PVP_ACTIVE_SEASON));
        return true;
    }

    static bool HandlePvPSeasonRestoreCommand(ChatHandler* handler, char const* /*args*/)
    {
        uint32 const season = sWorld->getIntConfig(CONFIG_PVP_ACTIVE_SEASON);
        if (!CharacterDatabase.PQuery("SELECT 1 FROM character_brackets_info_season WHERE season = %u LIMIT 1", season))
        {
            handler->PSendSysMessage("Season %u has no save.", season);
            handler->SetSentErrorMessage(true);
            return false;
        }

        sWorld->setWorldState(WS_PVP_SEASON_PENDING, PVP_SEASON_PENDING_RESTORE);
        handler->PSendSysMessage("At the next start, the ratings of season %u will go back to their save; what was played since is lost. .pvpseason cancel to undo.",
            season);
        return true;
    }

    static bool HandlePvPSeasonCancelCommand(ChatHandler* handler, char const* /*args*/)
    {
        sWorld->setWorldState(WS_PVP_SEASON_PENDING, PVP_SEASON_PENDING_NONE);
        handler->SendSysMessage("Nothing will be done at the next start.");
        return true;
    }
};

void AddSC_honor_commandscript()
{
    new honor_commandscript();
}
