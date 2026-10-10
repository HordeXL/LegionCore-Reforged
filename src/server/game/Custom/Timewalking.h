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

#ifndef TIMEWALKING_H
#define TIMEWALKING_H

#include "Define.h"
#include <ctime>

// Timewalking weeks come one expansion after the other in release order (The Burning Crusade, Wrath of
// the Lich King, Cataclysm, Mists of Pandaria), so the same one never comes twice in a row: one every
// Timewalking.Interval weeks, every week by default, whatever the content tier.
namespace Timewalking
{
    uint32 GetIntervalWeeks();
    // a quest of a timewalking week may be offered: the raid ones never are
    bool IsQuestOpen(uint32 questId);

    // rotation slot of a timewalking holiday, -1 for any other holiday
    int32 GetSlot(uint32 holidayId);
    // a week of that slot, starting at the weekly reset
    time_t GetFirstStart(uint32 slot);
    // the running week of that slot, or its next one
    time_t GetCurrentStart(uint32 slot);
    // minutes between two weeks of the same slot
    uint32 GetPeriodMinutes();

    // writes the coming weeks of each expansion into custom_calendar_event; to run before
    // CalendarAnnouncements::Publish
    void PrepareCalendar();
}

#endif
