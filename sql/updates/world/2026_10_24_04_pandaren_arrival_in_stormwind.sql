-- Joining the Alliance: Aysa and Jojo walk with the pandaren, and Stormwind reacts as they pass
DELETE FROM `creature_text` WHERE `CreatureID` IN (61792,61793,61834,61836,61837,61838,61839,61840,61841,61895,61896);
DELETE FROM `creature_text` WHERE (`CreatureID`=65153 AND `GroupID` BETWEEN 4 AND 7) OR (`CreatureID`=68 AND `GroupID`=6);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextID`,`MinTimer`,`MaxTimer`,`SpellID`,`comment`) VALUES
(68,6,0,'Never thought I''d see one of your kind walk through here.',12,0,100,1,0,0,61418,0,0,0,'Stormwind City Guard - pandaren arrival'),
(65153,4,0,'Pandaren? What business do you have in Stormwind?',12,0,100,6,0,0,61397,0,0,0,'General Hammond Clay - pandaren arrival'),
(65153,5,0,'Emperor? You''ll find KING Anduin inside Stormwind Keep.',12,0,100,1,0,0,61398,0,0,0,'General Hammond Clay - pandaren arrival'),
(65153,6,0,'%s eyes Jojo''s pillar.',16,0,100,0,0,0,61399,0,0,0,'General Hammond Clay - pandaren arrival'),
(65153,7,0,'Behave yourselves inside Stormwind, pandaren. You''re in Alliance territory now.',12,0,100,1,0,0,61400,0,0,0,'General Hammond Clay - pandaren arrival'),
(61792,0,0,'We''re here to join the Alliance. We seek audience with your Emperor.',12,0,100,1,0,0,61417,0,0,0,'Aysa Cloudsinger - pandaren arrival'),
(61792,1,0,'Look at this!',14,0,100,5,0,0,61422,0,0,0,'Aysa Cloudsinger - pandaren arrival'),
(61792,2,0,'Well, that''s good news. Once we join the Alliance, we certainly won''t run out of things to do.',12,0,100,1,0,0,61423,0,0,0,'Aysa Cloudsinger - pandaren arrival'),
(61792,3,0,'Let''s keep moving.',12,0,100,1,0,0,61415,0,0,0,'Aysa Cloudsinger - pandaren arrival'),
(61793,0,0,'Let''s... just keep moving.',12,0,100,1,0,0,61409,0,0,0,'Jojo Ironbrow - pandaren arrival'),
(61793,1,0,'What''s the Light?',12,0,100,6,0,0,61416,0,0,0,'Jojo Ironbrow - pandaren arrival'),
(61895,0,0,'Hey, look! Gnolls!',12,0,100,25,0,0,61401,0,0,0,'Marty - pandaren arrival'),
(61896,0,0,'Those aren''t gnolls, silly. Use your eyes.',12,0,100,1,0,0,61402,0,0,0,'Josie - pandaren arrival'),
(61896,1,0,'Those are FURBOLGS.',12,0,100,1,0,0,61403,0,0,0,'Josie - pandaren arrival'),
(61836,0,0,'Teacher... look!',12,0,100,25,0,0,61404,0,0,0,'Moni Widdlesprock - pandaren arrival'),
(61836,1,0,'Pandaren? Here, in Stormwind?',12,0,100,6,0,0,61406,0,0,0,'Moni Widdlesprock - pandaren arrival'),
(61834,0,0,'Yes. Those are pandaren, Moni.',12,0,100,1,0,0,61405,0,0,0,'Alyn Black - pandaren arrival'),
(61838,0,0,'Heh... pandaren. You must be here to join the Alliance.',12,0,100,1,0,0,61407,0,0,0,'Gavin Marlsbury - pandaren arrival'),
(61838,1,0,'Good move. It worked out well for me.',12,0,100,1,0,0,61408,0,0,0,'Gavin Marlsbury - pandaren arrival'),
(61837,0,0,'Welcome to Stormwind!',12,0,100,3,0,0,61410,0,0,0,'Leria Nightwind - pandaren arrival'),
(61841,0,0,'Pandaren? I mussht be seein'' thingssh...',12,0,100,0,0,0,61411,0,0,0,'Brunn Goldenmug - pandaren arrival'),
(61839,0,0,'Quiet, Naanae. Outsiders approach.',12,0,100,1,0,0,61412,0,0,0,'Lucas Severing - pandaren arrival'),
(61840,0,0,'Outsiders, yes - but their intentions are good.',12,0,100,1,0,0,61413,0,0,0,'Naanae - pandaren arrival'),
(61840,1,0,'Look carefully, Lucas. The Light is strong with them. Particularly that one.',12,0,100,1,0,0,61414,0,0,0,'Naanae - pandaren arrival');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (60566,61792,61793,61834,61836,61837,61838,61839,61840,61841,65153,107574,61895,61896);

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (60566,61792,61793,61836,61837,61838,61839,61841,65153);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND ((`entryorguid`=61895 AND `id`=1) OR (`entryorguid`=107574 AND `id` IN (1,2)));
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (6179200,6179201,6189500,6183600,6183800,6183900,6515300);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Aysa at the gate sends her companions along with the pandaren
(60566,0,0,1,'',19,0,100,0,30987,0,0,0,0,12,61792,3,900000,0,0,0,7,0,0,0,0,0,0,0,0,'Aysa Cloudsinger - On Joining the Alliance accepted - Summon Aysa'),
(60566,0,1,0,'',61,0,100,0,0,0,0,0,0,12,61793,3,900000,0,0,0,7,0,0,0,0,0,0,0,0,'Aysa Cloudsinger - Linked - Summon Jojo'),
(61792,0,0,0,'',63,0,100,0,0,0,0,0,0,29,3,2,0,0,0,0,21,10,0,0,0,0,0,0,0,'Aysa Cloudsinger - On created - Follow the pandaren'),
(61792,0,1,0,'',63,0,100,0,0,0,0,0,0,80,6179200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aysa Cloudsinger - On created - The first guard reacts'),
(61792,0,2,0,'',1,0,100,1,2000,2000,2000,2000,0,80,6179201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aysa Cloudsinger - Near the Hero''s Call Board - Comment on it'),
(61793,0,0,0,'',63,0,100,0,0,0,0,0,0,29,3,4,0,0,0,0,21,10,0,0,0,0,0,0,0,'Jojo Ironbrow - On created - Follow the pandaren'),
(65153,0,0,0,'',10,0,100,0,1,20,120000,120000,0,80,6515300,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'General Hammond Clay - Pandaren on Joining the Alliance in sight - Question them'),
(61895,0,1,0,'',10,0,100,0,1,15,120000,120000,0,80,6189500,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Marty - Pandaren on Joining the Alliance in sight - Gnolls!'),
(61836,0,0,0,'',10,0,100,0,1,15,120000,120000,0,80,6183600,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Moni Widdlesprock - Pandaren on Joining the Alliance in sight - Point them out'),
(61838,0,0,0,'',10,0,100,0,1,15,120000,120000,0,80,6183800,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gavin Marlsbury - Pandaren on Joining the Alliance in sight - Welcome them'),
(61837,0,0,0,'',10,0,100,0,1,15,120000,120000,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Leria Nightwind - Pandaren on Joining the Alliance in sight - Welcome to Stormwind'),
(61841,0,0,0,'',10,0,100,0,1,12,120000,120000,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Brunn Goldenmug - Pandaren on Joining the Alliance in sight - Seeing things'),
(61839,0,0,0,'',10,0,100,0,1,15,120000,120000,0,80,6183900,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lucas Severing - Pandaren on Joining the Alliance in sight - Outsiders approach'),
-- Anduin sends the companions home once the pandaren have joined
(107574,0,1,2,'',20,0,100,0,30987,0,0,0,0,41,0,0,0,0,0,0,11,61792,60,0,0,0,0,0,0,'Anduin Wrynn - On Joining the Alliance rewarded - Despawn Aysa'),
(107574,0,2,0,'',61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,61793,60,0,0,0,0,0,0,'Anduin Wrynn - Linked - Despawn Jojo'),
-- timed lists
(6179200,9,0,0,'',0,0,100,0,6000,6000,0,0,0,1,6,0,0,0,0,0,19,68,40,0,0,0,0,0,0,'Aysa Cloudsinger - Closest guard - Never thought I''d see one of your kind'),
(6179201,9,0,0,'',0,0,100,0,0,0,0,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aysa Cloudsinger - Look at this!'),
(6179201,9,1,0,'',0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aysa Cloudsinger - Good news'),
(6515300,9,0,0,'',0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Hammond Clay - What business'),
(6515300,9,1,0,'',0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,19,61792,30,0,0,0,0,0,0,'General Hammond Clay - Aysa: we seek your Emperor'),
(6515300,9,2,0,'',0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Hammond Clay - KING Anduin'),
(6515300,9,3,0,'',0,0,100,0,4000,4000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Hammond Clay - Eyes Jojo''s pillar'),
(6515300,9,4,0,'',0,0,100,0,3000,3000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Hammond Clay - Behave yourselves'),
(6189500,9,0,0,'',0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marty - Gnolls!'),
(6189500,9,1,0,'',0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,61896,20,0,0,0,0,0,0,'Marty - Josie: those aren''t gnolls'),
(6189500,9,2,0,'',0,0,100,0,3500,3500,0,0,0,1,1,0,0,0,0,0,19,61896,20,0,0,0,0,0,0,'Marty - Josie: those are furbolgs'),
(6183600,9,0,0,'',0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moni Widdlesprock - Teacher, look'),
(6183600,9,1,0,'',0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,61834,15,0,0,0,0,0,0,'Moni Widdlesprock - Alyn: those are pandaren'),
(6183600,9,2,0,'',0,0,100,0,3500,3500,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moni Widdlesprock - Here, in Stormwind?'),
(6183800,9,0,0,'',0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavin Marlsbury - You must be here to join'),
(6183800,9,1,0,'',0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavin Marlsbury - It worked out well for me'),
(6183800,9,2,0,'',0,0,100,0,3500,3500,0,0,0,1,0,0,0,0,0,0,19,61793,30,0,0,0,0,0,0,'Gavin Marlsbury - Jojo: let''s just keep moving'),
(6183900,9,0,0,'',0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lucas Severing - Outsiders approach'),
(6183900,9,1,0,'',0,0,100,0,3500,3500,0,0,0,1,0,0,0,0,0,0,19,61840,10,0,0,0,0,0,0,'Lucas Severing - Naanae: their intentions are good'),
(6183900,9,2,0,'',0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,19,61840,10,0,0,0,0,0,0,'Lucas Severing - Naanae: the Light is strong with them'),
(6183900,9,3,0,'',0,0,100,0,4500,4500,0,0,0,1,3,0,0,0,0,0,19,61792,30,0,0,0,0,0,0,'Lucas Severing - Aysa: let''s keep moving'),
(6183900,9,4,0,'',0,0,100,0,2500,2500,0,0,0,1,1,0,0,0,0,0,19,61793,30,0,0,0,0,0,0,'Lucas Severing - Jojo: what''s the Light?');

-- only a pandaren on the quest sets the scenes off; Aysa speaks up at the board she can see
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND ((`SourceGroup`=1 AND `SourceEntry` IN (65153,61836,61838,61837,61841,61839)) OR (`SourceGroup`=2 AND `SourceEntry`=61895) OR (`SourceGroup`=3 AND `SourceEntry`=61792));
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,65153,0,0,9,0,30987,0,0,0,0,'','General Hammond Clay - invoker on Joining the Alliance'),
(22,2,61895,0,0,9,0,30987,0,0,0,0,'','Marty - invoker on Joining the Alliance'),
(22,1,61836,0,0,9,0,30987,0,0,0,0,'','Moni Widdlesprock - invoker on Joining the Alliance'),
(22,1,61838,0,0,9,0,30987,0,0,0,0,'','Gavin Marlsbury - invoker on Joining the Alliance'),
(22,1,61837,0,0,9,0,30987,0,0,0,0,'','Leria Nightwind - invoker on Joining the Alliance'),
(22,1,61841,0,0,9,0,30987,0,0,0,0,'','Brunn Goldenmug - invoker on Joining the Alliance'),
(22,1,61839,0,0,9,0,30987,0,0,0,0,'','Lucas Severing - invoker on Joining the Alliance'),
(22,3,61792,0,0,30,1,206111,12,0,0,0,'','Aysa Cloudsinger - near the Hero''s Call Board');
