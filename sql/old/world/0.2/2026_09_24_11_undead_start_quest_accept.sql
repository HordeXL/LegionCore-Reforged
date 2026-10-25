-- Undead starting scene (Deathknell): Agatha lifts Rigor Mortis (73523) when Fresh out of the Grave is accepted.
-- The quest was auto-accepted as soon as its window opened, so the undead rose before the player clicked Accept;
-- accepting it by hand keeps the scene on the click, as for the troll start (0x80000 = QUEST_FLAGS_AUTO_ACCEPT)
UPDATE `quest_template` SET `Flags` = `Flags` & ~0x80000 WHERE `ID` = 24959;
