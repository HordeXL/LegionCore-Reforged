-- Uldum introduction (quest 27003 "Easy Money"), scripted in zone_uldum.cpp.
--
-- Lady Humps (46517) gave the quest credit and teleported anyone who clicked her, quest or not, with no scene. The
-- click now casts Initialize Uldum Intro (86748) only while the quest is in progress; the script plays Adarrah's
-- lines, the fade to black (87107) over the pygmy ambush and wakes the player up in Adarrah's cage. Handing the
-- quest in opens the cage and brings a Neferset Jailer; once it dies, Prince Nadun calls the player over.
-- Texts are Blizzard's broadcast texts (localised by the client data).

-- Lady Humps: the old shortcut (credit + teleport) goes, the spellclick stays and is gated on the quest.
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 46517;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 46517 AND `source_type` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 46517 AND `SourceEntry` = 86748;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 46517, 86748, 0, 0, 9, 0, 27003, 0, 0, 0, 0, '', 'Lady Humps - Initialize Uldum Intro only while Easy Money is in progress');

DELETE FROM `spell_script_names` WHERE `spell_id` = 86748;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (86748, 'spell_uldum_initialize_intro');
UPDATE `creature_template` SET `ScriptName` = 'npc_uldum_adarrah_cage' WHERE `entry` = 46873;
UPDATE `creature_template` SET `ScriptName` = 'npc_uldum_neferset_jailer', `AIName` = '' WHERE `entry` = 48029;

DELETE FROM `creature_text` WHERE `CreatureID` IN (44833, 46719, 46873, 46872);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(44833, 0, 0, 'No, no, silly $r...', 12, 0, 100, 11, 0, 0, 46688, 0, 0, 0, 'Adarrah - Easy Money, Lady Humps clicked'),
(44833, 1, 0, 'No one rides the Lady!', 12, 0, 100, 274, 0, 0, 46689, 0, 0, 0, 'Adarrah - Easy Money, Lady Humps clicked'),
(46719, 0, 0, 'Attack!', 12, 0, 100, 0, 0, 18260, 46761, 0, 0, 0, 'Pygmy Ambusher - Uldum intro ambush'),
(46719, 1, 0, 'How many coconuts can we get for the ugly one?', 12, 0, 100, 396, 0, 18259, 46774, 0, 0, 0, 'Pygmy Ambusher - Uldum intro ambush'),
(46719, 2, 0, 'THREE? He woulda paid five, easy... Dummy!', 12, 0, 100, 0, 0, 18259, 46839, 0, 0, 0, 'Pygmy Ambusher - Uldum intro ambush'),
(46873, 0, 0, 'Crap!  That was my last lock pick!', 12, 0, 100, 0, 0, 0, 48272, 0, 0, 0, 'Adarrah - Easy Money rewarded, cage opened'),
(46872, 0, 0, 'Our captors have allied with Deathwing, $r.', 12, 0, 100, 396, 0, 0, 46820, 0, 0, 0, 'Prince Nadun - Neferset Jailer killed'),
(46872, 1, 0, 'No mercy remains in them. Make your peace.', 12, 0, 100, 396, 0, 0, 46821, 0, 0, 0, 'Prince Nadun - Neferset Jailer killed');

-- Scene actors left standing at the cages, on top of the quest NPCs: other Adarrahs (46781, 47912, 48030, 48028),
-- a second Budd (46782) and Prince Nadun (47896), and the jailers (48029, 48011) that the script now brings in. Kept:
-- Adarrah 46873 (hands Easy Money in), Budd 46875, Harkor, Mack, Samir, Prince Nadun 46872.
DELETE FROM `creature` WHERE `guid` IN (191708, 191707, 191706, 190941, 191709, 191712, 191660, 191703);
DELETE FROM `creature_addon` WHERE `guid` IN (191708, 191707, 191706, 190941, 191709, 191712, 191660, 191703);
-- Static cage models stacked on the two cage doors (206953): the door opened, the cage around it stayed shut.
DELETE FROM `gameobject` WHERE `guid` IN (63476, 63403, 63475);

-- Fellow prisoners: Budd, Mack, Harkor and Samir sit in their cages (Mack, Harkor and Samir wandered 3 yards).
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (190944, 190940, 190942, 190945);
DELETE FROM `creature_addon` WHERE `guid` IN (190944, 190940, 190942, 190945);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(190944, 0, 0, 1, 1, 0, ''),
(190940, 0, 0, 1, 1, 0, ''),
(190942, 0, 0, 1, 1, 0, ''),
(190945, 0, 0, 1, 1, 0, '');

-- Tanzar (46877) is alone in the last cage: he wandered out of its open door. The closed cage model there (206949)
-- had gone with the stacked models above: the open door becomes that closed cage again, and Tanzar sits still.
UPDATE `gameobject` SET `id` = 206949, `state` = 1 WHERE `guid` = 63405;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 190943;
DELETE FROM `creature_addon` WHERE `guid` = 190943;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (190943, 0, 0, 1, 1, 0, '');
-- The player's cage door: only Adarrah's lock pick opens it (the script), the player cannot click it open.
UPDATE `gameobject_template` SET `flags` = `flags` | 0x12 WHERE `entry` = 206953;   -- locked, not selectable
