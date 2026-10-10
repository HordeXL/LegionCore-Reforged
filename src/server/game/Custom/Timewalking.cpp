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

#include "Timewalking.h"
#include "Common.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "SharedDefines.h"
#include "World.h"
#include <algorithm>
#include <iterator>

namespace
{
    // release order
    uint32 const Holidays[] = { HOLIDAY_TIMEWALKING_BC, HOLIDAY_TIMEWALKING_WOTLK, HOLIDAY_TIMEWALKING_CATACLYSM, HOLIDAY_TIMEWALKING_PANDARIA };

    // weekly quests of the two raids (Disturbance Detected, Black Temple and Ulduar): the raids are not open
    uint32 const RaidQuests[] = { 47523, 50316 };

    // the weekly reset of Legion's launch week (Tuesday 30 August 2016 with the default reset day)
    time_t Anchor()
    {
        tm t = { };
        t.tm_year = 2016 - 1900;
        t.tm_mon = 7;
        t.tm_mday = 28 + int(sWorld->getIntConfig(CONFIG_WEEKLY_RESET_DAY));    // the 28th was a Sunday
        t.tm_hour = int(sWorld->getIntConfig(CONFIG_WEEKLY_RESET_HOUR));
        t.tm_isdst = -1;
        return mktime(&t);
    }

    // counted in calendar days, so that a week past a daylight saving change still starts at the reset hour
    time_t AddDays(time_t time, int64 days)
    {
        tm t;
        localtime_r(&time, &t);
        t.tm_mday += int(days);
        t.tm_isdst = -1;
        return mktime(&t);
    }
}

uint32 Timewalking::GetIntervalWeeks()
{
    return std::max<uint32>(sWorld->getIntConfig(CONFIG_TIMEWALKING_INTERVAL), 1);
}

bool Timewalking::IsQuestOpen(uint32 questId)
{
    return std::find(std::begin(RaidQuests), std::end(RaidQuests), questId) == std::end(RaidQuests);
}

int32 Timewalking::GetSlot(uint32 holidayId)
{
    for (uint32 slot = 0; slot < std::size(Holidays); ++slot)
        if (Holidays[slot] == holidayId)
            return int32(slot);
    return -1;
}

time_t Timewalking::GetFirstStart(uint32 slot)
{
    return AddDays(Anchor(), int64(slot) * GetIntervalWeeks() * 7);
}

time_t Timewalking::GetCurrentStart(uint32 slot)
{
    time_t const now = time(nullptr);
    int64 const periodDays = int64(GetPeriodMinutes()) * MINUTE / DAY;
    time_t start = GetFirstStart(slot);
    if (now > start)
        start = AddDays(start, int64((now - start) / (periodDays * DAY)) * periodDays);
    if (now >= AddDays(start, 7))
        start = AddDays(start, periodDays);
    return start;
}

uint32 Timewalking::GetPeriodMinutes()
{
    return uint32(std::size(Holidays)) * GetIntervalWeeks() * WEEK / MINUTE;
}

void Timewalking::PrepareCalendar()
{
    bool const enabled = sWorld->getBoolConfig(CONFIG_TIMEWALKING_ENABLE);
    time_t const period = time_t(GetPeriodMinutes()) * MINUTE;

    for (uint32 slot = 0; slot < std::size(Holidays); ++slot)
    {
        time_t const start = GetCurrentStart(slot);
        WorldDatabase.DirectPExecute("UPDATE custom_calendar_event SET StartDate = FROM_UNIXTIME(%u), EndDate = NULL, DurationDays = 7, "
            "RepeatDays = %u, Enabled = %u WHERE HolidayID = %u", uint32(start), uint32(period / DAY), uint32(enabled), Holidays[slot]);
    }

    TC_LOG_INFO("server.loading", ">> Timewalking: %s, one week every %u", enabled ? "on" : "off", GetIntervalWeeks());
}
