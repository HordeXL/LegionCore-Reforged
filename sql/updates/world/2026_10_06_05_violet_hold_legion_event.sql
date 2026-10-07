-- Assault on Violet Hold (1544): event rework (scenario steps, portals opened by Lord Malgath, intro, texts)

-- The wave portal is the Teleportation Portal Lord Malgath opens (102279, target of his Portal Periodic 201901), not the
-- intro one (102267) that carried the script.
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 102267;
UPDATE `creature_template` SET `ScriptName` = 'npc_teleportation_portal_vh_leg' WHERE `entry` = 102279;

-- Blazing Infernal (102398) belongs to the elite squads (5 points of "Invasion Forces") but had no script: it now
-- walks to the prison seal like the rest of the squad.
UPDATE `creature_template` SET `ScriptName` = 'npc_violet_hold_trash' WHERE `entry` = 102398;

-- Lieutenant Sinclari: the text column held a broken Russian copy; the client text comes from the broadcast text.
DELETE FROM `creature_text` WHERE `CreatureID` = 102278;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(102278, 0, 0, 'Prison guards, we are leaving! These adventurers are taking over! Go go go!', 14, 0, 100, 0, 0, 0, 31474, 0, 0, 0, 'Lieutenant Sinclari - Event start'),
(102278, 1, 0, 'I''m locking the door. Good luck, and thank you for doing this.', 12, 0, 100, 0, 0, 0, 31475, 0, 0, 0, 'Lieutenant Sinclari - Door locked'),
(102278, 2, 0, 'A Portal Keeper emerges from the portal!', 41, 0, 100, 0, 0, 0, 32996, 0, 0, 0, 'Lieutenant Sinclari - Portal Keeper'),
(102278, 3, 0, 'An elite Legion squad appears from the portal!', 41, 0, 100, 0, 0, 0, 104686, 0, 0, 0, 'Lieutenant Sinclari - Elite squad'),
(102278, 4, 0, 'A Portal Guardian defends the new portal!', 41, 0, 100, 0, 0, 0, 32995, 0, 0, 0, 'Lieutenant Sinclari - Portal Guardian');

-- Lord Malgath: Russian copies spread over the wrong groups and never spoken. One group per moment of the event, the
-- prisoner introductions indexed by boss (groups 1-6), all with their broadcast text and sound.
DELETE FROM `creature_text` WHERE `CreatureID` = 102282;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(102282, 0, 0, 'You are just in time for the Legion''s first strike on Dalaran. These prisoners will paint the city streets red with blood. It''s a shame you won''t be alive to see it happen.', 14, 0, 100, 0, 0, 57927, 107014, 0, 0, 0, 'Lord Malgath - First portal'),
(102282, 0, 1, 'The fall of Dalaran begins here. These prisoners will stain the streets red with blood. And when they''re done, the Legion will bring this city crashing to the ground!', 14, 0, 100, 0, 0, 57928, 107015, 0, 0, 0, 'Lord Malgath - First portal'),
(102282, 1, 0, 'Your armor might protect you from blade and claw, but it is useless against this Faceless One. With a mere whisper, it can drive a mortal mind to madness.', 14, 0, 100, 0, 0, 57929, 107016, 0, 0, 0, 'Lord Malgath - Releases Mindflayer Kaahrj'),
(102282, 2, 0, 'I have witnessed horrors that would put your darkest nightmares to shame, but I have never seen anything as terrifying as THIS... an angry gnomish inventor.', 14, 0, 100, 0, 0, 57930, 107017, 0, 0, 0, 'Lord Malgath - Releases Millificent Manastorm'),
(102282, 2, 1, 'I sense great fury and bitterness in this gnome. She has kept these feelings bottled up for so long... It is only a matter of time before she explodes.', 14, 0, 100, 0, 0, 57931, 107018, 0, 0, 0, 'Lord Malgath - Releases Millificent Manastorm'),
(102282, 3, 0, 'Even with magical wards in place, I can still smell the reek of this wretched Abomination. Do the world a favor and dispose of it, will you?', 14, 0, 100, 0, 0, 57932, 107019, 0, 0, 0, 'Lord Malgath - Releases Festerface'),
(102282, 4, 0, 'Ah... even I have heard of Shivermaw, the fallen blue dragon once known as Eldragosa. She will be perfect for terrorizing the skies of Dalaran.', 14, 0, 100, 0, 0, 57933, 107021, 0, 0, 0, 'Lord Malgath - Releases Shivermaw'),
(102282, 5, 0, 'Crypt lords do not take defeat well. Being locked in this prison will have made this one angry... Very, VERY angry.', 14, 0, 100, 0, 0, 57936, 107024, 0, 0, 0, 'Lord Malgath - Releases Anub''esset'),
(102282, 5, 1, 'Come now, Anub''esset! You call yourself a great crypt lord, and you can''t even burrow your way out of this prison? Show us why you are to be feared!', 14, 0, 100, 0, 0, 57937, 107026, 0, 0, 0, 'Lord Malgath - Releases Anub''esset'),
(102282, 6, 0, 'Blood-Princess Thal''ena... You must be hungry after all these years in prison. Go and slake your thirst on the blood and souls of Dalaran!', 14, 0, 100, 0, 0, 57934, 107022, 0, 0, 0, 'Lord Malgath - Releases Blood-Princess Thal''ena'),
(102282, 6, 1, 'The San''layn are cold and arrogant creatures. They inflict pain for pure entertainment. All in all, they sound like my kind of people.', 14, 0, 100, 0, 0, 57935, 107023, 0, 0, 0, 'Lord Malgath - Releases Blood-Princess Thal''ena'),
(102282, 7, 0, 'I expected more from these prisoners. If they cannot break you, then I will.', 14, 0, 100, 0, 0, 57938, 107028, 0, 0, 0, 'Lord Malgath - Third step'),
(102282, 8, 0, 'Enough! These prisoners are useless. As the old saying goes: "If you want to destroy a floating city the right way, you have to do it yourself."', 14, 0, 100, 0, 0, 57939, 107029, 0, 0, 0, 'Lord Malgath - Comes down to fight'),
(102282, 9, 0, 'The rest of Dalaran will join you soon.', 14, 0, 100, 0, 0, 57940, 107030, 0, 0, 0, 'Lord Malgath - Kills a player'),
(102282, 9, 1, 'Another so-called hero falls to the Legion!', 14, 0, 100, 0, 0, 57942, 107032, 0, 0, 0, 'Lord Malgath - Kills a player'),
(102282, 10, 0, 'Pity... I will not see the world... burn...', 14, 0, 100, 0, 0, 57945, 107035, 0, 0, 0, 'Lord Malgath - Death');
