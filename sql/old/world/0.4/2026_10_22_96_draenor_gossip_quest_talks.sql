-- Draenor quest gossips: talk credits, Krikka's summon, Andren's follower choice, the frozen envelope and Glirin's tank scene happen on the option.
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (75081, 80860, 81723, 82489);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (75081, 80860, 81723, 82489) AND `id` BETWEEN 0 AND 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 81912 AND `id` IN (1, 2, 3);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 84766 AND `id` IN (0, 1, 3, 4, 5);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(75081, 0, 0, 1, '', 62, 0, 100, 0, 16143, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Young Orc Woman - On gossip option 0 selected - Close gossip'),
(75081, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 56, 107271, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Young Orc Woman - On gossip option 0 selected - Add Frozen Envelope'),
(80860, 0, 0, 1, '', 62, 0, 100, 0, 16515, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'High Ravenspeaker Krikka - On gossip option 0 selected - Close gossip'),
(80860, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 167511, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'High Ravenspeaker Krikka - On gossip option 0 selected - Invoker cast Force Cast Summon Krikka'),
(81723, 0, 0, 1, '', 62, 0, 100, 0, 16665, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Birchus - On gossip option 0 selected - Close gossip'),
(81723, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, 81723, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Birchus - On gossip option 0 selected - Quest credit'),
(82489, 0, 0, 1, '', 62, 0, 100, 0, 16745, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Apprentice Artificer Andren - On gossip option 0 selected - Close gossip'),
(82489, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 166130, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Apprentice Artificer Andren - On gossip option 0 selected - Invoker cast Follower: Apprentice Artificer Andren'),
(82489, 0, 2, 0, '', 62, 0, 100, 0, 16745, 1, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Apprentice Artificer Andren - On gossip option 1 selected - Close gossip'),
(81912, 0, 2, 3, '', 62, 0, 100, 0, 16609, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Zipfizzle - On gossip option 0 selected - Close gossip'),
(81912, 0, 3, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, 81660, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Zipfizzle - On gossip option 0 selected - Quest credit Speak with Zipfizzle'),
(84766, 0, 3, 4, '', 62, 0, 100, 0, 16895, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Glirin - On gossip option 0 selected - Close gossip'),
(84766, 0, 4, 5, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 169506, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Glirin - On gossip option 0 selected - Invoker cast Kill Credit'),
(84766, 0, 5, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 80, 8476600, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Glirin - On gossip option 0 selected - Run tank interstitial action list');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (16143, 16609, 16665, 16745, 16895);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 16143, 0, 0, 0, 2, 0, 107271, 1, 1, 1, 0, '', 'Young Orc Woman - Letter option hidden while carrying the Frozen Envelope'),
(15, 16143, 0, 0, 0, 2, 0, 107272, 1, 1, 1, 0, '', 'Young Orc Woman - Letter option hidden while carrying the Frostwolf First-Fang'),
(15, 16143, 0, 0, 0, 2, 0, 112206, 1, 1, 1, 0, '', 'Young Orc Woman - Letter option hidden while carrying the Talisman of Yearning Unfulfilled'),
(15, 16143, 0, 0, 0, 8, 0, 33525, 0, 0, 1, 0, '', 'Young Orc Woman - Letter option hidden once the treasure is done'),
(15, 16609, 0, 0, 0, 9, 0, 34778, 0, 0, 0, 0, '', 'Foreman Zipfizzle - Option only during Migrant Workers'),
(15, 16665, 0, 0, 0, 9, 0, 33685, 0, 0, 0, 0, '', 'Birchus - Option during Ambassador to the Ancient (Alliance)'),
(15, 16665, 0, 0, 1, 9, 0, 36437, 0, 0, 0, 0, '', 'Birchus - Option during Ambassador to the Ancient (Horde)'),
(15, 16745, 0, 0, 0, 8, 0, 35626, 0, 0, 1, 0, '', 'Apprentice Artificer Andren - Choice hidden once Andren is chosen'),
(15, 16745, 0, 0, 0, 8, 0, 35628, 0, 0, 1, 0, '', 'Apprentice Artificer Andren - Choice hidden once Rangari Chel is chosen'),
(15, 16745, 0, 0, 0, 8, 0, 35629, 0, 0, 1, 0, '', 'Apprentice Artificer Andren - Choice hidden once Vindicator Onaala is chosen'),
(15, 16895, 0, 0, 0, 9, 0, 35055, 0, 0, 0, 0, '', 'Glirin - Option only while his quest is active');
