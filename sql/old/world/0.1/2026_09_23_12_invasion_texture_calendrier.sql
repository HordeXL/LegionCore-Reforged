-- The invasion takes a proper calendar image, in three phases.
--
-- Blizzard's holidays use no single icon but a start / ongoing / end triptych, filed under
-- `interface/calendar/holidays/`. The world quest one fits:
--
--   1467050  calendar_weekendworldqueststart.blp     start
--   1467049  calendar_weekendworldquestongoing.blp   ongoing
--   1467048  calendar_weekendworldquestend.blp       end
--
-- The scenario banner (1243535) is set aside: it is a full-size interface element, not a calendar
-- thumbnail. It stays noted for the event itself.
UPDATE `custom_calendar_event`
   SET `Texture1` = 1467050,
       `Texture2` = 1467049,
       `Texture3` = 1467048,
       `Notes` = 'world event; scenario banner 1243535, invaded zones map 1243609'
 WHERE `HolidayID` = 222;
