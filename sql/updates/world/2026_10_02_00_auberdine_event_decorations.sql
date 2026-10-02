-- Darkshore, ruins of Auberdine (area 442): Brewfest and Hallow's End decorations still hung on the
-- pre-Cataclysm town, which the Cataclysm left in ruins. They float around buildings that no longer stand.
-- Lor'danel (area 4659) keeps its own decorations.
DELETE FROM `game_event_gameobject` WHERE `eventEntry` = 24 AND `guid` IN (72962, 72963, 72964, 72975, 72976, 72977, 73117,
  73118, 73444, 73445, 73446, 73454, 73455, 73458, 73630, 73631, 73632, 73633);
DELETE FROM `gameobject` WHERE `guid` IN (72962, 72963, 72964, 72975, 72976, 72977, 73117, 73118, 73444, 73445, 73446, 73454,
  73455, 73458, 73630, 73631, 73632, 73633);

DELETE FROM `game_event_gameobject` WHERE `eventEntry` = 12 AND `guid` IN (74172, 74272, 74404, 74405, 74406, 74407, 74408,
  74409, 74410, 74411, 74412, 74413, 74414, 74415, 74416, 74417, 74418, 74419, 74420, 74421, 74422, 74423, 74424, 74425, 74426,
  74427, 74679, 74680, 74681, 74682, 75267);
DELETE FROM `gameobject` WHERE `guid` IN (74172, 74272, 74404, 74405, 74406, 74407, 74408, 74409, 74410, 74411, 74412, 74413,
  74414, 74415, 74416, 74417, 74418, 74419, 74420, 74421, 74422, 74423, 74424, 74425, 74426, 74427, 74679, 74680, 74681, 74682,
  75267);
