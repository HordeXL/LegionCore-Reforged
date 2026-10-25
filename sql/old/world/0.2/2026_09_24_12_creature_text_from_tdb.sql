-- Creature texts repaired from TDB 7.3.5, or TDB 12.1 when its broadcast text exists in the 7.3.5 client.
-- 1. Lines without a broadcast text, left in Russian or German by an old import, get the TDB English line
--    and its broadcast text when TDB has the same group and index (three Gilneas lines matched by hand).
-- 2. Groups that SmartAI scripts ask for but that had no text at all (the creature stayed silent) are taken
--    from TDB. A group that already has a line is never touched.
DELETE FROM `creature_text` WHERE `CreatureID` = 3439 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '416C72696768742C20616C7269676874212049207468696E6B20492063616E20666967757265206F757420686F7720746F206F7065726174652074686973207468696E67C383C2A2C3A2E2809AC2ACC382C2A6';
DELETE FROM `creature_text` WHERE `CreatureID` = 3439 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'Alright, alright! I think I can figure out how to operate this thing...';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (3439, 0, 0, 'Alright, alright! I think I can figure out how to operate this thing...', 12, 0, 100, 0, 0, 0, 1031, 0, 0, 0, 'wizzlecrank SAY_START');
DELETE FROM `creature_text` WHERE `CreatureID` = 3439 AND `GroupID` = 3 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '4C6F6F6B73206C696B65207765277265206F7574206F662074686520776F6F64732C2065683F20576F6E6465722077686174207468697320646F6573C383C2A2C3A2E2809AC2ACC382C2A6';
DELETE FROM `creature_text` WHERE `CreatureID` = 3439 AND `GroupID` = 3 AND `ID` = 0 AND `Text` = 'Looks like we\'re out of the woods, eh? Wonder what this does...';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (3439, 3, 0, 'Looks like we\'re out of the woods, eh? Wonder what this does...', 12, 0, 100, 0, 0, 0, 1033, 0, 0, 0, 'wizzlecrank SAY_PROGRESS_1');
DELETE FROM `creature_text` WHERE `CreatureID` = 3439 AND `GroupID` = 5 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '49276C6C207374617920626568696E6420616E642067756172642074686520777265636B2E2048757272792120486F706566756C6C79206E6F206F6E652077696C6C206E6F746963652074686520736D6F6B65C383C2A2C3A2E2809AC2ACC382C2A6';
DELETE FROM `creature_text` WHERE `CreatureID` = 3439 AND `GroupID` = 5 AND `ID` = 0 AND `Text` = 'That was a close one! Well, let\'s get going, we\'re almost there.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (3439, 5, 0, 'That was a close one! Well, let\'s get going, we\'re almost there.', 12, 0, 100, 0, 0, 0, 1041, 0, 0, 0, 'wizzlecrank SAY_PROGRESS_3');
DELETE FROM `creature_text` WHERE `CreatureID` = 12277 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '5468616E6B20796F752C20244E2E20416E64206E6F77207765C3A2E282ACE284A27265206C656176696E6721';
DELETE FROM `creature_text` WHERE `CreatureID` = 12277 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'Thanks $n.  Now let\'s get out of here!';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (12277, 0, 0, 'Thanks $n.  Now let\'s get out of here!', 12, 0, 100, 1, 0, 0, 7540, 0, 0, 0, 'Melizza Brimbuzzle');
DELETE FROM `creature_text` WHERE `CreatureID` = 17977 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C2A0C391E284A2C390C2A1C3A2E282ACC5A1C390C2A0C391E280A220C390C2A0C391E28094C390C2A0C391E280A2C390C2A1C390C692C390C2A0C391CB9CC390C2A0C382C2B5C390C2A0C382C2BB20C390C2A0C390E280A0C390C2A1C3A2E282ACC5A1C390C2A0C391E280A2C390C2A1C390E2809AC390C2A0C391E28093C390C2A0C390E280A6C390C2A1C391E2809CC390C2A1C3A2E282ACC5A1C390C2A1C390C5A0C390C2A1C390C692C390C2A1C390C28F20C390C2A0C390E280A020C390C2A1C390C692C390C2A0C390E280A0C390C2A1C390C28FC390C2A1C3A2E282ACC5A1C390C2A0C391E28098C390C2A0C382C2BBC390C2A0C391E28098C390C2A1C3A2E282ACC2B0C390C2A0C382C2B53F';
DELETE FROM `creature_text` WHERE `CreatureID` = 17977 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'Who disturbs this sanctuary?';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (17977, 0, 0, 'Who disturbs this sanctuary?', 14, 0, 100, 0, 0, 20024, 20024, 0, 0, 0, 'warp SAY_AGGRO');
DELETE FROM `creature_text` WHERE `CreatureID` = 17977 AND `GroupID` = 2 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C2A0C391E284A2C390C2A0C391E280A220C390C2A0C391CB9CC390C2A0C390E280A6C390C2A0C382C2B52C20C390C2A0C392E28098C390C2A0C382C2B5C390C2A1C3A2E282ACC5A1C390C2A0C391E2809820C390C2A0C391CB9CC390C2A0C391E280A2C390C2A0C391E2809821';
DELETE FROM `creature_text` WHERE `CreatureID` = 17977 AND `GroupID` = 2 AND `ID` = 0 AND `Text` = 'Children, come to me!';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (17977, 2, 0, 'Children, come to me!', 14, 0, 100, 0, 0, 18376, 18376, 0, 0, 0, 'warp SAY_SUMMON_1');
DELETE FROM `creature_text` WHERE `CreatureID` = 17977 AND `GroupID` = 3 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C2A0C3A2E282ACE284A2C390C2A1C390C692C390C2A0C382C2B520C390C2A1C390C592C390C2A1C3A2E282ACC5A1C390C2A0C391E280A22E2E2E20C390C2A1C3A2E282ACC5A1C390C2A0C382C2B0C390C2A0C391E2809D20C390C2A1C390C692C390C2A1C3A2E282ACC5A1C390C2A1C390E2809AC390C2A0C382C2B0C390C2A0C390E280A6C390C2A0C390E280A6C390C2A0C391E280A22E2E2E20C390C2A0C391CB9CC390C2A0C390E280A6C390C2A0C382C2B52E2E2E20C390C2A0C382C2B7C390C2A0C392E28098C390C2A0C382C2B5C390C2A1C390C692C390C2A1C390C5A020C390C2A0C390E280A6C390C2A0C382C2B520C390C2A0C391CB9CC390C2A0C382C2B5C390C2A1C390C692C390C2A1C3A2E282ACC5A1C390C2A0C391E280A22E';
DELETE FROM `creature_text` WHERE `CreatureID` = 17977 AND `GroupID` = 3 AND `ID` = 0 AND `Text` = 'So... confused. Do not... belong here.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (17977, 3, 0, 'So... confused. Do not... belong here.', 14, 0, 100, 0, 0, 20028, 20028, 0, 0, 0, 'warp SAY_DEATH');
DELETE FROM `creature_text` WHERE `CreatureID` = 19527 AND `GroupID` = 1 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '257320C390C2BFC390C2BEC390C2B3C390C2BBC390C2BEC391E280B0C390C2B0C390C2B5C391E2809A20C390C2A2C390C2B5C390C2BDC390C2B5C390C2B2C391C692C391C5BD20C391C28DC390C2BDC390C2B5C391E282ACC390C2B3C390C2B8C391C5BD20C390C2BFC391E282ACC390C2BEC391E2809AC390C2B8C390C2B2C390C2BDC390C2B8C390C2BAC390C2B02E';
DELETE FROM `creature_text` WHERE `CreatureID` = 19527 AND `GroupID` = 1 AND `ID` = 0 AND `Text` = '%s absorbs the arcane energy of the attack.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (19527, 1, 0, '%s absorbs the arcane energy of the attack.', 16, 0, 100, 0, 0, 0, 17109, 0, 0, 34338, 'Vacillating Voidcaller');
DELETE FROM `creature_text` WHERE `CreatureID` = 25165 AND `GroupID` = 7 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C2A0C391E28099C390C2A0C382C2BBC390C2A0C382C2B0C390C2A0C3A2E2809EE28093C390C2A1C3A2E282ACC5A1C390C2A0C382C2B5C390C2A1C390C692C390C2A1C390C69220C390C2A0C390E280A0C390C2A0C391E280A2C390C2A0C382C2B7C390C2A0C392E28098C390C2A0C382C2B5C390C2A0C3A2E2809EE28093C390C2A1C390C692C390C2A1C3A2E282ACC5A1C390C2A0C390E280A0C390C2A1C391E2809CC390C2A0C382C2B5C390C2A1C3A2E282ACC5A120C390C2A0C390E280A6C390C2A0C382C2B0207C332D3328246E2920C390C2A0C382C2B7C390C2A0C382C2B0C390C2A0C391E2809DC390C2A0C382C2BBC390C2A0C391E28098C390C2A0C390E280A6C390C2A0C382C2B0C390C2A0C390E280A6C390C2A0C391E28098C390C2A0C382C2B5C390C2A0C391CB9C2022C390C2A0C3A2E282ACE284A2C390C2A0C391E280A2C390C2A1C390C692C390C2A0C391E28094C390C2A0C382C2BBC390C2A0C382C2B0C390C2A0C391CB9CC390C2A0C382C2B5C390C2A0C390E280A6C390C2A0C382C2B5C390C2A0C390E280A6C390C2A0C391E28098C390C2A0C382C2B5222E';
DELETE FROM `creature_text` WHERE `CreatureID` = 25165 AND `GroupID` = 7 AND `ID` = 0 AND `Text` = 'Alythess! Your fire burns within me!';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (25165, 7, 0, 'Alythess! Your fire burns within me!', 41, 0, 100, 0, 0, 0, 24452, 0, 0, 0, 'eredar - YELL_SISTER_ALYTHESS_DEAD');
DELETE FROM `creature_text` WHERE `CreatureID` = 37870 AND `GroupID` = 3 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '536F2077696520476F6C6472696E6E732047656973742065696E737420756E73657265204472756964656E207365676E6574652C20736F206C6173737420246E2067657365676E6574207365696E206D697420646572205765697368656974207365696E657320566F6C6B657320756E64206465722057696C64686569742064657320576F6C66676F7474732E';
DELETE FROM `creature_text` WHERE `CreatureID` = 37870 AND `GroupID` = 3 AND `ID` = 0 AND `Text` = 'Just as Goldrinn\'s spirit once blessed our druids, let $n be blessed with the wisdom of his race and the ferocity of the wolf god.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (37870, 3, 0, 'Just as Goldrinn\'s spirit once blessed our druids, let $n be blessed with the wisdom of his race and the ferocity of the wolf god.', 12, 0, 100, 1, 0, 0, 37727, 369922, 369922, 0, 'Lyros Flinkwind to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 37953 AND `GroupID` = 3 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '42656E75747A742042656C79737261732054616C69736D616E2C20756D207A7520656E746B6F6D6D656E2C206265766F72206465722064756E6B6C65205370C383C2A4686572206175662045756368207363686965C383C5B87421244224427C54496E746572666163655C49636F6E735C696E765F6A6577656C72795F74616C69736D616E5F31302E626C703A36347C74';
DELETE FROM `creature_text` WHERE `CreatureID` = 37953 AND `GroupID` = 3 AND `ID` = 0 AND `Text` = 'Use Belysra\'s Talisman to escape before the Dark Scout shoots you!$B$B|TInterface\\Icons\\inv_jewelry_talisman_10.blp:64|t';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (37953, 3, 0, 'Use Belysra\'s Talisman to escape before the Dark Scout shoots you!$B$B|TInterface\\Icons\\inv_jewelry_talisman_10.blp:64|t', 42, 0, 100, 1, 0, 0, 37674, 4922, 4922, 0, 'Dunkle SpÃ¤herin to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 38051 AND `GroupID` = 3 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '44617269757321204469652064756E6B6C656E205370C383C2A468657220686162656E206469652053696368656C212053696520686162656E2073696520766F7220756E732065727265696368742E';
DELETE FROM `creature_text` WHERE `CreatureID` = 38051 AND `GroupID` = 3 AND `ID` = 0 AND `Text` = 'Darius!  The Dark Rangers have the Scythe!  They got to it before we were able to reach it.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (38051, 3, 0, 'Darius!  The Dark Rangers have the Scythe!  They got to it before we were able to reach it.', 12, 0, 100, 0, 0, 0, 37810, 7328, 7328, 0, 'Tobias Dunstmantel to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 38120 AND `GroupID` = 6 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C29DC390C2B520C391E2809AC390C2BEC391E282ACC390C2BEC390C2BFC390C2B8C391C281C391C5922C202467C390C2BFC391E282ACC390C2B8C391C28FC391E2809AC390C2B5C390C2BBC391C5923AC390C2B4C390C2B5C390C2B2C390C2BEC391E280A1C390C2BAC390C2B03B2E20C390CB9C20C390C2B2C390C2BE20C391E280A1C391E2809AC390C2BE20C390C2B6C390C2B520C390C2BCC390C2BDC390C2B520C390C2BFC390C2B5C391E282ACC390C2B5C390C2B4C390C2B5C390C2BBC390C2B0C391E2809AC391C59220C391C28DC391E2809AC390C2BEC391E2809A20C391E282ACC390C2B5C390C2B0C390C2BAC391E2809AC390C2B8C390C2B2C390C2BDC391E280B9C390C2B920C391C281C390C2B0C390C2BFC390C2BEC390C2B33F20C390C2A5C390C2BC2DC390C2BCC3A2E282ACC2A6';
DELETE FROM `creature_text` WHERE `CreatureID` = 38120 AND `GroupID` = 6 AND `ID` = 0 AND `Text` = 'Take your time, my $g boy : girl;. Now what can I modify this shredder boot to be? Hmm.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (38120, 6, 0, 'Take your time, my $g boy : girl;. Now what can I modify this shredder boot to be? Hmm.', 12, 0, 100, 6, 0, 0, 50086, 0, 0, 0, 'Hobart Grapplehammer to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 44365 AND `GroupID` = 5 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390E2809DC390C2B02CC390E28099C390C2BEC390C2B6C390C2B4C391C5922E20C390C2A2C390C2B0C390C2BA20C390C2B2C390C2BEC391E2809A2C20C391C28F20C391C281C390C2BDC391C28FC390C2BBC390C2B020C391C28120C390C5BEC391E2809AC391E282ACC390C2B5C390C2BAC391CB86C390C2B8C391E280A6C391C281C391C28F20C390C2B8C391E280A620C390C2BFC391E282ACC390C2BEC390C2BAC390C2BBC391C28FC391E2809AC390C2B8C390C2B521';
DELETE FROM `creature_text` WHERE `CreatureID` = 44365 AND `GroupID` = 5 AND `ID` = 0 AND `Text` = 'Very well, Warchief. I have solved the plight of the Forsaken!';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (44365, 5, 0, 'Very well, Warchief. I have solved the plight of the Forsaken!', 12, 0, 100, 5, 0, 0, 44705, 0, 0, 0, 'VO_QE_SP_Sylvanas_SPEvent06');
DELETE FROM `creature_text` WHERE `CreatureID` = 91544 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C5BEC391E2809AC390C2BBC390C2B8C391E280A1C390C2BDC390C2BE2C20C390C2BFC390C2B0C391E282ACC390C2BDC390C2B82120C390E28099C391E280B920C391C281C390C2BFC390C2B0C391C281C390C2BBC390C2B820C390C2B2C390C2B0C391CB86C390C2B5C390C2B3C390C2BE20C390C2BBC391C5BDC390C2B1C390C2B8C390C2BCC390C2BEC390C2B3C390C2BE20C390C2BAC390C2B0C390C2BFC390C2B8C391E2809AC390C2B0C390C2BDC390C2B020C390C2B82E2E2E20C391C28DC390C2B92C20C390C2B2C391E280B920C391E280A1C391E2809AC390C2BE20C391E2809AC390C2B2C390C2BEC391E282ACC390C2B8C391E2809AC390C2B53F21';
DELETE FROM `creature_text` WHERE `CreatureID` = 91544 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'Stand to and bring that thing down or its the gullet for all of you.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (91544, 0, 0, 'Stand to and bring that thing down or its the gullet for all of you.', 14, 0, 100, 0, 0, 0, 93617, 0, 0, 0, 'Captain Blindside');
DELETE FROM `creature_text` WHERE `CreatureID` = 93823 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390E2809DC390C2BEC390C2B1C391E282ACC390C2BE20C390C2BFC390C2BEC390C2B6C390C2B0C390C2BBC390C2BEC390C2B2C390C2B0C391E2809AC391C59220C390C2B220C390C2A7C390C2B5C391E282ACC391E2809AC390C2BEC390C2B3C390C2B820C390E2809DC390C2BEC390C2B1C390C2BBC390C2B5C391C281C391E2809AC390C2B82C20C390C2B3C390C2B4C390C2B520C391C281C390C2BCC390C2B5C390C2BBC391C592C391E280A1C390C2B0C390C2BAC390C2B820C390C2B6C390C2B8C390C2B2C391C692C391E2809A20C390C2B2C390C2B5C391E280A1C390C2BDC390C2BE21';
DELETE FROM `creature_text` WHERE `CreatureID` = 93823 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'Welcome to Skyhold! Here the brave live on forever!';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (93823, 0, 0, 'Welcome to Skyhold! Here the brave live on forever!', 12, 0, 100, 0, 0, 0, 98601, 0, 0, 0, 'Danica the Reclaimer to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 93823 AND `GroupID` = 1 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390E28094C390C2B020C391E2809AC390C2BEC390C2B1C390C2BEC390C2B920C390C2BDC390C2B0C391E280A6C390C2BEC390C2B4C390C2B8C391E2809AC391C281C391C28F20C390E2809CC390C2BBC390C2B0C390C2B720C390C5BEC390C2B4C390C2B8C390C2BDC390C2B02C20C390C2BAC390C2BEC391E2809AC390C2BEC391E282ACC391E280B9C390C2B920C390C2B2C390C2B8C390C2B4C390C2B8C391E2809A20C390C2B2C390C2B5C391C281C391C59220C390C290C390C2B7C390C2B5C391E282ACC390C2BEC391E2809A2120C390C29020C390C2B220C391E2809AC390C2BEC390C2B920C391C281C391E2809AC390C2BEC391E282ACC390C2BEC390C2BDC390C2B520C3A2E282ACE2809C20C390C2BAC391C692C390C2B7C390C2BDC391C28F2C20C390C2B3C390C2B4C390C2B520C390C2A5C390C2B5C390C2BBC390C2B3C390C2B0C391E282AC2C20C390C2B2C390C2B5C390C2BBC390C2B8C391E280A1C390C2B0C390C2B9C391CB86C390C2B8C390C2B920C390C2BAC391C692C390C2B7C390C2BDC390C2B5C391E280A02C20C390C2BAC391C692C390C2B5C391E2809A20C391C281C390C2B0C390C2BCC390C2BEC390C2B520C390C2BCC390C2BEC391E280B0C390C2BDC390C2BEC390C2B520C390C2BEC391E282ACC391C692C390C2B6C390C2B8C390C2B520C390C2B4C390C2BBC391C28F20C390C2B2C390C2B0C390C2BBC390C2B0C391E282ACC391C592C391C28FC391E282ACC390C2BEC390C2B22E';
DELETE FROM `creature_text` WHERE `CreatureID` = 93823 AND `GroupID` = 1 AND `ID` = 0 AND `Text` = 'Behind you lies the Eye of Odyn, which peers across all of Azeroth! This way lies the Forge, where the mightiest weapons of the valarjar are crafted by Helgar, the greatest smith in the Halls.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (93823, 1, 0, 'Behind you lies the Eye of Odyn, which peers across all of Azeroth! This way lies the Forge, where the mightiest weapons of the valarjar are crafted by Helgar, the greatest smith in the Halls.', 12, 0, 100, 0, 0, 0, 98370, 0, 0, 0, 'Danica the Reclaimer to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 93823 AND `GroupID` = 3 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C5BEC390C2B4C390C2B8C390C2BD20C390C2B6C390C2B4C390C2B5C391E2809A20C390C2B2C390C2BFC390C2B5C391E282ACC390C2B5C390C2B4C390C2B82E20C390C2AF20C390C2BFC390C2BEC390C2B9C390C2B4C391C69220C390C2B820C390C2BEC390C2B1C391C5A0C391C28FC390C2B2C390C2BBC391C5BD20C390C2BE20C391E2809AC390C2B2C390C2BEC390C2B5C390C2BC20C390C2BFC391E282ACC390C2B8C390C2B1C391E280B9C391E2809AC390C2B8C390C2B82E20C390C29DC390C2B520C390C2B7C390C2B0C390C2B1C391E280B9C390C2B2C390C2B0C390C2B920C390C2BEC390C2B120C391C692C390C2B2C390C2B0C390C2B6C390C2B5C390C2BDC390C2B8C390C2B82E';
DELETE FROM `creature_text` WHERE `CreatureID` = 93823 AND `GroupID` = 3 AND `ID` = 0 AND `Text` = 'Odyn awaits ahead. I will go forth and announce you. Be respectful!';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (93823, 3, 0, 'Odyn awaits ahead. I will go forth and announce you. Be respectful!', 12, 0, 100, 0, 0, 0, 98372, 0, 0, 0, 'Danica the Reclaimer to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 93967 AND `GroupID` = 1 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C2AD2DC391C28D2E2E2EC390C2AF20C390C2BFC391E282ACC390C2BEC391C281C391E2809AC390C2BE2E2E2EC390C2BFC391E282ACC390C2B8C391C281C390C2BCC390C2B0C391E2809AC391E282ACC390C2B8C390C2B2C390C2B0C390C2BB20C390C2BDC390C2BEC390C2B2C391E280B9C390C2B520C390C2BAC391E282ACC390C2B0C391C281C390C2B8C391E2809AC390C2B5C390C2BBC390C2B820C390C2B4C390C2BBC391C28F20C391E2809AC390C2BAC390C2B0C390C2BDC390C2B82E20C390E2809DC390C2B02DC390C2B4C390C2B02E20C390C29DC390C2BEC390C2B2C391E280B9C390C2B520C390C2BAC391E282ACC390C2B0C391C281C390C2B8C391E2809AC390C2B5C390C2BBC390C2B82E20C390C2AF20C390C2BDC390C2B5C390C2BCC390C2B5C390C2B4C390C2BBC390C2B5C390C2BDC390C2BDC390C2BE20C390C2B2C390C2B5C391E282ACC390C2BDC391C692C391C281C391C59220C390C2B220C390C2B0C391E2809AC390C2B5C390C2BBC391C592C390C2B52E';
DELETE FROM `creature_text` WHERE `CreatureID` = 93967 AND `GroupID` = 1 AND `ID` = 0 AND `Text` = 'Let\'s see, did I remember the spritethorn needles...?';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (93967, 1, 0, 'Let\'s see, did I remember the spritethorn needles...?', 12, 0, 0, 0, 0, 0, 98219, 0, 0, 0, 'Lyndras');
DELETE FROM `creature_text` WHERE `CreatureID` = 101061 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C5B8C391E282ACC390C2B8C390C2B2C390C2B5C391E2809A2C20246E2E20C390C29DC390C2B0C390C2BAC390C2BEC390C2BDC390C2B5C391E280A02DC391E2809AC390C2BE20C390C2BCC390C2BDC390C2B520C391C692C390C2B4C390C2B0C390C2BBC390C2BEC391C281C391C59220C391E2809AC390C2B5C390C2B1C391C28F20C390C2BDC390C2B0C390C2B9C391E2809AC390C2B82E20C390C2A2C390C2B5C390C2B1C391C28F20C390C2B6C390C2B4C391C692C391E2809A20C390C2BDC390C2B020C390E280BAC391C692C390C2BDC390C2BDC390C2BEC390C2B920C390C2BFC390C2BEC390C2BBC391C28FC390C2BDC390C2B52E';
DELETE FROM `creature_text` WHERE `CreatureID` = 101061 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'Greetings, $n. It is fortunate I found you. Your presence is requested at Moonglade.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (101061, 0, 0, 'Greetings, $n. It is fortunate I found you. Your presence is requested at Moonglade.', 12, 0, 100, 0, 0, 0, 103448, 0, 0, 0, 'Archdruid Hamuul Runetotem to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 101344 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C5BEC391E2809AC390C2BBC390C2B8C391E280A1C390C2BDC390C2BE2C20C391E2809AC390C2B5C390C2BFC390C2B5C391E282ACC391C59220C390C2B7C390C2B0C390C2B9C390C2B4C390C2B820C390C2B220C390C2BFC390C2BEC391E282ACC391E2809AC390C2B0C390C2BB20C390C2B220C390E2809DC390C2B0C390C2BBC390C2B0C391E282ACC390C2B0C390C2BDC391C281C390C2BAC390C2B8C390C2B920C390C2BAC391E282ACC390C2B0C391E2809AC390C2B5C391E282AC2C20C390C2B020C390C2B7C390C2B0C391E2809AC390C2B5C390C2BC20C390C2BFC391E282ACC390C2BEC391C281C391E2809AC390C2BE20C390C2BBC390C2B5C391E2809AC390C2B820C390C2BDC390C2B020C391C281C390C2B5C390C2B2C390C2B5C391E282AC2E20C390C5BEC390C2BD20C390C2B1C391C692C390C2B4C390C2B5C391E2809A20C391E2809AC390C2B5C390C2B1C391C28F20C390C2B6C390C2B4C390C2B0C391E2809AC391C59221';
DELETE FROM `creature_text` WHERE `CreatureID` = 101344 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'Master $n, if I could get your attention for a moment!';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (101344, 0, 0, 'Master $n, if I could get your attention for a moment!', 12, 0, 100, 1, 0, 0, 103668, 0, 0, 0, 'Hooded Priestess to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 102018 AND `GroupID` = 0 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = 'C390C5B8C390C2BEC391C281C390C2BBC390C2B0C390C2BDC390C2B8C390C2B520C391C281C390C2B5C390C2BAC391E282ACC390C2B5C391E2809AC390C2BDC390C2BEC390C2B52E20C390C5B8C391E282ACC390C2BEC391E280A1C390C2B8C391E2809AC390C2B0C390C2B920C390C2B5C390C2B3C390C2BE20C390C2B820C391C281C391E282ACC390C2B0C390C2B7C391C69220C390C2B6C390C2B520C391C692C390C2BDC390C2B8C391E280A1C391E2809AC390C2BEC390C2B6C391C5922E';
DELETE FROM `creature_text` WHERE `CreatureID` = 102018 AND `GroupID` = 0 AND `ID` = 0 AND `Text` = 'This is for your eyes only. Once you\'ve read it, destroy it.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (102018, 0, 0, 'This is for your eyes only. Once you\'ve read it, destroy it.', 12, 0, 100, 0, 0, 0, 104305, 0, 0, 0, 'Ravenholdt Courier to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 102018 AND `GroupID` = 1 AND `ID` = 0 AND `BroadcastTextID` = 0 AND HEX(`Text`) = '246E2C20C390C2BCC390C2BEC390C2B6C390C2BDC390C2BE20C391E2809AC390C2B5C390C2B1C391C28F20C390C2BDC390C2B020C390C2BCC390C2B8C390C2BDC391C692C391E2809AC390C2BAC391C6923F20C390C2A1C391E282ACC390C2BEC391E280A1C390C2BDC390C2BEC390C2B520C391C281C390C2BEC390C2BEC390C2B1C391E280B0C390C2B5C390C2BDC390C2B8C390C2B52E';
DELETE FROM `creature_text` WHERE `CreatureID` = 102018 AND `GroupID` = 1 AND `ID` = 0 AND `Text` = 'Farewell.';
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES (102018, 1, 0, 'Farewell.', 12, 0, 100, 1, 0, 0, 0, 0, 0, 0, 'Ravenholdt Courier to Player');
DELETE FROM `creature_text` WHERE `CreatureID` = 80 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 94 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 474 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 523 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 881 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2015 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2017 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2018 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 2019 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2020 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2021 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2021 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 2859 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2949 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2991 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3114 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3277 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3569 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3584 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3627 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3692 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3692 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 3695 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3696 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3733 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3734 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3734 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 3743 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3758 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3762 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3763 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3765 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3767 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3770 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3772 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3823 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3825 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3921 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3925 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3932 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3987 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4273 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4295 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4306 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4385 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4673 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4726 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4831 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4831 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 4832 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4832 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 4832 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 4855 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4983 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 4983 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 4983 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 4983 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 4983 AND `GroupID` = 8;
DELETE FROM `creature_text` WHERE `CreatureID` = 5236 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5240 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5346 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5465 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5629 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5646 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 5709 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5786 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5787 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5952 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 5953 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6075 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6115 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6190 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6222 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6224 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6235 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6329 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 6329 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 6927 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7149 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7157 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7267 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7267 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 7267 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 7271 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7271 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 7274 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7274 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 7320 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7327 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7328 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7329 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7432 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7433 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7434 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7523 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7524 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7730 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 7849 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8127 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8127 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 8127 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 8201 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8201 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 8205 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8567 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8567 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 8761 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8877 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8906 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8956 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 8958 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9042 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9216 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9259 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9268 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9454 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9462 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9547 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9716 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 9796 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 10321 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 10405 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 10433 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 10488 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 10639 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 10680 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 10807 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11058 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11142 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11360 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11441 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11469 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11486 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11496 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11501 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11582 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11747 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11793 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 11880 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 12347 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 12636 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 12859 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 12918 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 12918 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 13601 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14321 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14322 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14323 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14325 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14325 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 14325 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 14326 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14344 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14426 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14435 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14718 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 14753 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 15542 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 15623 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 16098 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 16204 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 16309 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 16328 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 16329 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 16523 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17259 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17271 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17281 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17300 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17311 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17312 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17312 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 17312 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 17312 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 17312 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 17370 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17455 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17621 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17623 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17626 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17664 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17664 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 17723 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17727 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17728 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17729 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17732 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17734 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17735 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17805 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17840 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17843 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17853 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17853 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 17976 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 17976 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 17976 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 17976 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 17978 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 17978 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 17978 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 17978 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 17978 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 17978 AND `GroupID` = 6;
DELETE FROM `creature_text` WHERE `CreatureID` = 17978 AND `GroupID` = 7;
DELETE FROM `creature_text` WHERE `CreatureID` = 18105 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 18311 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 18322 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 18632 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 18635 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 18638 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 18995 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 19209 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 19218 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 19219 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 19632 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 21694 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 22259 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 22273 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 23597 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 23618 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 23651 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 23671 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 23678 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 23863 AND `GroupID` = 7;
DELETE FROM `creature_text` WHERE `CreatureID` = 24014 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24078 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24398 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24531 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24531 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 24531 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 24635 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24830 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24960 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24966 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 24972 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25242 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25243 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25244 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 253 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25428 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25429 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25432 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25467 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25470 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25470 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 25682 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25836 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25949 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25951 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 25979 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 26196 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 26199 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 26762 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 26798 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 26798 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 26798 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 26815 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 27246 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 27551 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 27588 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 27683 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 27683 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 27683 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 27683 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 27683 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 27683 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 27713 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 27871 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 27986 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28076 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28078 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28095 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28103 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28105 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28474 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28474 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 28474 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 28474 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 28474 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 28474 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 28557 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28575 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28601 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28890 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 28917 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29028 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29112 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29112 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 29112 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 29112 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 29112 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 29112 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 29193 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29193 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 29193 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 29193 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 29193 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 29193 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 29193 AND `GroupID` = 6;
DELETE FROM `creature_text` WHERE `CreatureID` = 29437 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29439 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29490 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29643 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29643 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 29643 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 29643 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 29644 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 29644 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 29644 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 29644 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 30243 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 30453 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 30632 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 31279 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 31279 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 32859 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 32860 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 32863 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 32868 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 32888 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 32989 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 33079 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 33356 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 33356 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 34033 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34033 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 34046 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34413 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34499 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34545 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34560 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34592 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34733 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34851 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34931 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34934 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34937 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34939 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34941 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 34947 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 35190 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 35190 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 35503 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36013 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36147 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36287 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36288 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36289 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36384 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36385 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36407 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36712 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36815 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36884 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 36884 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 36936 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 37112 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 37112 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 37157 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 37171 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 37513 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 37513 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 37513 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 38659 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 38880 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 38880 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 39020 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 39061 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 39174 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 39186 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 39279 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 40665 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 40906 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 40959 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 42391 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 42391 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 42391 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 43657 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 44722 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 44882 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 44882 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 44882 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 44883 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 44883 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 44883 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 44883 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 6;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 7;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 8;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 9;
DELETE FROM `creature_text` WHERE `CreatureID` = 44884 AND `GroupID` = 10;
DELETE FROM `creature_text` WHERE `CreatureID` = 45387 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 45410 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 45410 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 45410 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 45410 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 45438 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 45438 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 45438 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 45438 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 45438 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 46254 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 46254 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 46264 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 46264 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 46383 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 46383 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 47387 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 47585 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 47630 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 47679 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 47804 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 48727 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 48740 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 48740 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 50053 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 51712 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 1008 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 1052 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 1164 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 2391 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 3693 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 3693 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 4980 AND `GroupID` = 8;
DELETE FROM `creature_text` WHERE `CreatureID` = 29319 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 2;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 3;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 6;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 7;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 8;
DELETE FROM `creature_text` WHERE `CreatureID` = 40352 AND `GroupID` = 9;
DELETE FROM `creature_text` WHERE `CreatureID` = 40416 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 43191 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 48487 AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 48487 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 48487 AND `GroupID` = 2;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(80, 0, 1, 'Yiieeeee! Me run!', 12, 0, 50, 0, 0, 0, 1864, 0, 0, 0, 'combat Say'),
(80, 0, 0, 'You no take candle!', 12, 0, 50, 0, 0, 0, 1868, 0, 0, 0, 'combat Say'),
(94, 0, 0, 'You\'re in the wrong place at the wrong time, $g pal:missy;!', 12, 0, 100, 0, 0, 0, 42883, 0, 0, 0, 'combat Say'),
(474, 0, 0, 'The Brotherhood will not tolerate your actions.', 12, 7, 100, 0, 0, 0, 1866, 0, 0, 0, 'Defias Rogue Wizard - Random Say on Aggro'),
(474, 0, 1, 'Feel the power of the Brotherhood!', 12, 7, 100, 0, 0, 0, 1867, 0, 0, 0, 'Defias Rogue Wizard - Random Say on Aggro'),
(523, 0, 0, 'Guards!', 14, 6, 100, 0, 0, 0, 4583, 0, 0, 0, 'Thor'),
(881, 0, 0, 'The Brotherhood will not tolerate your actions.', 12, 7, 100, 0, 0, 0, 1866, 0, 0, 0, 'Surena Caledon - Random Say on Aggro'),
(881, 0, 1, 'Feel the power of the Brotherhood!', 12, 7, 100, 0, 0, 0, 1867, 0, 0, 0, 'Surena Caledon - Random Say on Aggro'),
(2015, 0, 0, 'You will be easy prey, $c.', 12, 0, 50, 0, 0, 0, 2231, 0, 0, 0, 'on Aggro Text'),
(2015, 0, 1, 'My talons will shred your puny body, $r.', 12, 0, 50, 0, 0, 0, 2230, 0, 0, 0, 'on Aggro Text'),
(2015, 0, 2, 'A fine trophy your head will make, $r.', 12, 0, 50, 0, 0, 0, 2229, 0, 0, 0, 'on Aggro Text'),
(2017, 0, 2, 'A fine trophy your head will make, $r.', 12, 0, 50, 0, 0, 0, 2229, 0, 0, 0, 'on Aggro Text'),
(2017, 0, 1, 'My talons will shred your puny body, $r.', 12, 0, 50, 0, 0, 0, 2230, 0, 0, 0, 'on Aggro Text'),
(2017, 0, 0, 'You will be easy prey, $c.', 12, 0, 50, 0, 0, 0, 2231, 0, 0, 0, 'on Aggro Text'),
(2018, 1, 2, 'A fine trophy your head will make, $r.', 12, 0, 50, 0, 0, 0, 2229, 0, 0, 0, 'on Aggro Text'),
(2018, 1, 1, 'My talons will shred your puny body, $r.', 12, 0, 50, 0, 0, 0, 2230, 0, 0, 0, 'on Aggro Text'),
(2018, 1, 0, 'You will be easy prey, $c.', 12, 0, 50, 0, 0, 0, 2231, 0, 0, 0, 'on Aggro Text'),
(2019, 0, 0, 'You will be easy prey, $c.', 12, 0, 50, 0, 0, 0, 2231, 0, 0, 0, 'on Aggro Text'),
(2019, 0, 1, 'My talons will shred your puny body, $r.', 12, 0, 50, 0, 0, 0, 2230, 0, 0, 0, 'on Aggro Text'),
(2019, 0, 2, 'A fine trophy your head will make, $r.', 12, 0, 50, 0, 0, 0, 2229, 0, 0, 0, 'on Aggro Text'),
(2020, 0, 0, 'You will be easy prey, $c.', 12, 0, 50, 0, 0, 0, 2231, 0, 0, 0, 'on Aggro Text'),
(2020, 0, 1, 'My talons will shred your puny body, $r.', 12, 0, 50, 0, 0, 0, 2230, 0, 0, 0, 'on Aggro Text'),
(2020, 0, 2, 'A fine trophy your head will make, $r.', 12, 0, 50, 0, 0, 0, 2229, 0, 0, 0, 'on Aggro Text'),
(2021, 0, 0, 'A fine trophy your head will make, $r.', 12, 0, 100, 0, 0, 0, 2229, 0, 0, 0, 'Bloodfeather Matriarch'),
(2021, 0, 1, 'My talons will shred your puny body, $r.', 12, 0, 100, 0, 0, 0, 2230, 0, 0, 0, 'Bloodfeather Matriarch'),
(2021, 0, 2, 'You will be easy prey, $c.', 12, 0, 100, 0, 0, 0, 2231, 0, 0, 0, 'Bloodfeather Matriarch'),
(2021, 1, 0, 'You will be easy prey, $c.', 12, 0, 50, 0, 0, 0, 2231, 0, 0, 0, 'on Aggro Text'),
(2021, 1, 1, 'My talons will shred your puny body, $r.', 12, 0, 50, 0, 0, 0, 2230, 0, 0, 0, 'on Aggro Text'),
(2021, 1, 2, 'A fine trophy your head will make, $r.', 12, 0, 50, 0, 0, 0, 2229, 0, 0, 0, 'on Aggro Text'),
(2859, 0, 0, 'Guards!', 14, 6, 100, 0, 0, 0, 4583, 0, 0, 0, 'Gyll'),
(2949, 0, 0, 'More bones to gnaw on...', 12, 0, 50, 0, 0, 0, 46596, 0, 0, 0, 'on Aggro Text'),
(2949, 0, 1, 'Grrrr... fresh meat!', 12, 0, 50, 0, 0, 0, 1870, 0, 0, 0, 'on Aggro Text'),
(2991, 0, 0, '%s gestures to the pitcher of water sitting on the edge of the well.', 16, 0, 100, 0, 0, 0, 1528, 0, 0, 0, 'Greatmother Hawkwind'),
(3114, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3277, 0, 0, 'My talons will shred your puny body, $R.', 12, 0, 100, 0, 0, 0, 2230, 0, 0, 0, 'Witchwing Roguefeather'),
(3569, 0, 0, 'Kill!!!', 12, 0, 100, 0, 0, 0, 1176, 0, 0, 0, 'Bogling'),
(3584, 0, 0, 'Ok, let\'s go!', 12, 2, 100, 0, 0, 0, 1189, 0, 0, 0, 'Therylune'),
(3627, 0, 0, 'Magical studies stressing your brain? Relax at the Blue Recluse!', 12, 7, 100, 0, 0, 0, 1197, 0, 0, 0, 'Erich Lohan'),
(3627, 0, 1, 'Best drinks in Stormwind!', 12, 7, 100, 0, 0, 0, 1195, 0, 0, 0, 'Erich Lohan'),
(3627, 0, 2, 'Come for the beer, stay for the atmosphere!', 12, 7, 100, 0, 0, 0, 1196, 0, 0, 0, 'Erich Lohan'),
(3627, 0, 3, 'The only place in Stormwind where magic and spirits mix, come to the Blue Recluse!', 12, 7, 100, 0, 0, 0, 1198, 0, 0, 0, 'Erich Lohan'),
(3627, 0, 4, 'Free drinks at the Blue Recluse!', 12, 7, 100, 0, 0, 0, 1193, 0, 0, 0, 'Erich Lohan'),
(3627, 0, 5, 'Feeling blue? Come on down to the Blue Recluse for a good time!', 12, 7, 100, 0, 0, 0, 1199, 0, 0, 0, 'Erich Lohan'),
(3627, 0, 6, 'Head on over to the Blue Recluse. Where everybody knows your name!', 12, 7, 100, 0, 0, 0, 1194, 0, 0, 0, 'Erich Lohan'),
(3692, 0, 0, 'Alright, let\'s go.', 12, 0, 100, 0, 0, 0, 5227, 0, 0, 0, 'Volcor'),
(3692, 1, 0, 'Oh no!  Here they come!', 12, 0, 100, 0, 0, 0, 3744, 0, 0, 0, 'Volcor'),
(3695, 0, 0, '%s growls in your direction before taking time to sniff you.', 16, 0, 0, 0, 0, 0, 1234, 0, 0, 0, 'Grimclaw'),
(3696, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3733, 0, 0, 'Some nice contagion of rot for you, my pretty?', 12, 0, 50, 0, 0, 0, 33329, 0, 0, 0, 'on Aggro Text'),
(3733, 0, 1, 'You will not stop us, filthy $R!', 12, 0, 50, 0, 0, 0, 33328, 0, 0, 0, 'on Aggro Text'),
(3733, 0, 2, 'What are you doing here?', 12, 0, 50, 0, 0, 0, 33330, 0, 0, 0, 'on Aggro Text'),
(3734, 0, 0, 'They say there\'s no rest for the wicked. That means you!', 12, 0, 50, 0, 0, 0, 33316, 0, 0, 0, 'say Text'),
(3734, 0, 1, 'How special... you\'re good at picking flowers. Are you going to send me a bouquet? Hahahaha!', 12, 0, 50, 0, 0, 0, 33322, 0, 0, 0, 'say Text'),
(3734, 0, 2, 'This is coward\'s work. We should be crushing the Alliance now!', 12, 0, 50, 0, 0, 0, 33317, 0, 0, 0, 'say Text'),
(3734, 0, 3, 'Work faster for the glory of the Horde!', 12, 0, 50, 0, 0, 0, 33320, 0, 0, 0, 'say Text'),
(3734, 0, 4, 'Warchief Hellscream will have your head if you don\'t pick up the pace,Forsaken!', 12, 0, 50, 0, 0, 0, 33321, 0, 0, 0, 'say Text'),
(3734, 1, 0, 'I\'ll crush you, puny $R!', 12, 0, 100, 0, 0, 0, 33332, 0, 0, 0, 'say Text'),
(3743, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3758, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3762, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3763, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3765, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3767, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3770, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3772, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3823, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3825, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3921, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzied Rage'),
(3925, 0, 0, '%s goes into a rage after seeing a friend fall in battle!', 16, 0, 100, 0, 0, 0, 1151, 0, 0, 0, 'Thistlefur Avenger'),
(3932, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(3987, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(4273, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(4295, 0, 0, 'There is no escape for you.  The Crusade shall destroy all who carry the Scourge\'s taint.', 12, 0, 0, 0, 0, 0, 2626, 0, 0, 0, 'Scarlet Myrmidon - Talk on low HP'),
(4306, 0, 0, 'Confess and we shall set you free.', 12, 7, 100, 0, 0, 0, 2570, 0, 0, 0, 'Scarlet Torturer'),
(4306, 0, 1, 'You will talk eventually.  You might as well spill it now.', 12, 7, 100, 0, 0, 0, 2569, 0, 0, 0, 'Scarlet Torturer'),
(4306, 0, 2, 'What?  Oh no, I don\'t care what you have to say.  I just enjoy inflicting pain.', 14, 7, 100, 0, 0, 0, 2571, 0, 0, 0, 'Scarlet Torturer'),
(4385, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(4673, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Hatefury Betrayer'),
(4726, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'Raging Thunder Lizard'),
(4831, 0, 0, 'You should not be here! Slay them!', 14, 0, 100, 0, 0, 5799, 6169, 0, 0, 0, 'Lady Sarevess'),
(4831, 1, 0, 'Paltry kill.', 14, 0, 100, 0, 0, 5801, 6170, 0, 0, 0, 'Lady Sarevess'),
(4832, 0, 0, 'Who dares disturb my meditation?', 14, 0, 100, 0, 0, 5802, 6171, 0, 0, 0, 'lord kelriss SAY_AGRRO'),
(4832, 1, 0, 'Sleep...', 14, 0, 100, 0, 0, 5804, 0, 0, 0, 0, 'lord kelriss SAY_SLEEP'),
(4832, 2, 0, 'Dust to dust.', 14, 0, 100, 0, 0, 5803, 6172, 0, 0, 0, 'lord kelriss SAY_DEATH'),
(4855, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Stonevault Brawler'),
(4983, 0, 0, 'I noticed some fire on that island over there. A human, too. Let\'s go check it out, $n.', 12, 1, 0, 0, 0, 0, 1669, 0, 0, 0, 'Ogron'),
(4983, 1, 0, 'That\'s Reethe alright. Let\'s go see what he has to say, yeah?', 12, 1, 0, 0, 0, 0, 1670, 0, 0, 0, 'Ogron'),
(4983, 2, 0, 'Just tell us what you know about the Shady Rest Inn, and I won\'t bash your skull in.', 12, 0, 0, 0, 0, 0, 1707, 0, 0, 0, 'Ogron'),
(4983, 3, 0, 'Look here, if you don\'t tell me about the fire--', 12, 0, 0, 0, 0, 0, 1709, 0, 0, 0, 'Ogron'),
(4983, 8, 0, 'Me smash! You die!', 12, 0, 0, 0, 0, 0, 1926, 0, 0, 0, 'Ogron'),
(4983, 8, 1, 'I\'ll crush you!', 12, 0, 0, 0, 0, 0, 1925, 0, 0, 0, 'Ogron'),
(5236, 0, 0, 'I\'ll crush you!', 12, 0, 50, 0, 0, 0, 1925, 0, 0, 0, 'on Aggro Text'),
(5236, 0, 1, 'Me smash! You die!', 12, 0, 50, 0, 0, 0, 1926, 0, 0, 0, 'on Aggro Text'),
(5236, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 50, 0, 0, 0, 1927, 0, 0, 0, 'on Aggro Text'),
(5240, 0, 0, 'I\'ll crush you!', 12, 0, 50, 0, 0, 0, 1925, 0, 0, 0, 'on Aggro Text'),
(5240, 0, 1, 'Me smash! You die!', 12, 0, 50, 0, 0, 0, 1926, 0, 0, 0, 'on Aggro Text'),
(5240, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 50, 0, 0, 0, 1927, 0, 0, 0, 'on Aggro Text'),
(5346, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 7798, 0, 0, 0, 'combat Enrage'),
(5465, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(5629, 0, 0, '$R, I\'ll have your head.', 12, 0, 100, 0, 0, 0, 34971, 0, 0, 0, 'on Aggro Text'),
(5646, 1, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(5709, 0, 0, 'This evil cannot be allowed to enter this world!  Come my children!', 14, 0, 100, 0, 0, 0, 4703, 0, 0, 0, 'Shade of Eranikus'),
(5786, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(5787, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(5952, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(5953, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(6075, 0, 0, '%s calls for help!', 16, 0, 100, 0, 0, 0, 2541, 0, 0, 0, 'emote Text'),
(6115, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(6190, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(6222, 0, 0, '%s is splashed by the blood and becomes irradiated!', 16, 0, 100, 0, 0, 0, 3367, 0, 0, 0, 'Leprous Technician'),
(6224, 0, 0, '%s is splashed by the blood and becomes irradiated!', 16, 0, 100, 0, 0, 0, 3367, 0, 0, 0, 'Leprous Machinesmith'),
(6235, 0, 0, 'Electric justice!', 14, 0, 100, 0, 0, 5811, 6177, 0, 0, 0, 'Electrocutioner 6000'),
(6329, 0, 0, '%s blood sprays into the air!', 16, 0, 100, 0, 0, 0, 3131, 0, 0, 0, 'Irradiated Pillager'),
(6329, 1, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 1191, 0, 0, 0, 'Irradiated Pillager'),
(6927, 0, 0, 'You\'re in the wrong place at the wrong time, $g pal:missy;!', 12, 0, 100, 0, 0, 0, 42883, 0, 0, 0, 'combat Say'),
(7149, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(7157, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(7267, 0, 0, 'Die, outlander!', 14, 0, 100, 0, 0, 5877, 6226, 0, 0, 0, 'combat Text'),
(7267, 1, 0, 'Feel the fury of the sands!', 14, 0, 100, 0, 0, 5879, 6227, 0, 0, 0, 'combat Text'),
(7267, 2, 0, 'The Sandfury reign supreme!', 14, 0, 100, 0, 0, 5878, 6228, 0, 0, 0, 'combat Text'),
(7271, 0, 0, 'How dare you enter my sanctum!', 12, 0, 100, 0, 0, 0, 3622, 0, 0, 0, 'Witch Doctor Zum\'rah'),
(7271, 1, 1, 'Sands consume you!', 14, 14, 100, 0, 0, 5872, 6221, 0, 0, 0, 'Witch Doctor Zum\'rah'),
(7274, 0, 0, 'Let the executions begin!', 14, 0, 100, 0, 0, 5874, 6223, 0, 0, 0, 'combat Say'),
(7274, 1, 0, 'Justice is done!', 14, 0, 100, 0, 0, 5875, 6224, 0, 0, 0, 'combat Say'),
(7320, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Stonevault Mauler'),
(7327, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Withered Warrior'),
(7328, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Withered Reaver'),
(7329, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Withered Quilguard'),
(7432, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(7433, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(7434, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(7523, 0, 0, 'It was all her fault! She told us to steal it!', 12, 0, 100, 0, 0, 0, 48852, 0, 0, 0, 'Highborne'),
(7523, 0, 1, 'It\'s our fault... the destruction is all our fault...', 12, 0, 100, 0, 0, 0, 48855, 0, 0, 0, 'Highborne'),
(7523, 0, 2, 'My children... what have I done?', 12, 0, 100, 0, 0, 0, 48853, 0, 0, 0, 'Highborne'),
(7523, 0, 3, 'No... I was to live forever... I will still...', 12, 0, 100, 0, 0, 0, 48854, 0, 0, 0, 'Highborne'),
(7523, 0, 4, 'So tired... just want to rest...', 12, 0, 100, 0, 0, 0, 48857, 0, 0, 0, 'Highborne'),
(7523, 0, 5, 'The crystal can still be found... if we can just find it again...', 12, 0, 100, 0, 0, 0, 48856, 0, 0, 0, 'Highborne'),
(7523, 0, 6, 'The crystal will save us! We can be saved!', 12, 0, 100, 0, 0, 0, 48858, 0, 0, 0, 'Highborne'),
(7524, 0, 0, 'It was all her fault! She told us to steal it!', 12, 0, 100, 0, 0, 0, 48852, 0, 0, 0, 'Anguished Highborne'),
(7524, 0, 1, 'It\'s our fault... the destruction is all our fault...', 12, 0, 100, 0, 0, 0, 48855, 0, 0, 0, 'Anguished Highborne'),
(7524, 0, 2, 'My children... what have I done?', 12, 0, 100, 0, 0, 0, 48853, 0, 0, 0, 'Anguished Highborne'),
(7524, 0, 3, 'No... I was to live forever... I will still...', 12, 0, 100, 0, 0, 0, 48854, 0, 0, 0, 'Anguished Highborne'),
(7524, 0, 4, 'So tired... just want to rest...', 12, 0, 100, 0, 0, 0, 48857, 0, 0, 0, 'Anguished Highborne'),
(7524, 0, 5, 'The crystal can still be found... if we can just find it again...', 12, 0, 100, 0, 0, 0, 48856, 0, 0, 0, 'Anguished Highborne'),
(7524, 0, 6, 'The crystal will save us! We can be saved!', 12, 0, 100, 0, 0, 0, 48858, 0, 0, 0, 'Anguished Highborne'),
(7730, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Furious Rage'),
(7849, 0, 0, 'Warning! Warning! Intruder alert! Intruder alert!', 14, 0, 100, 0, 0, 0, 4142, 0, 0, 0, 'Mobile Alert System'),
(8127, 0, 0, 'The children of Sul will protect their master. Rise once more Sul\'lithuz!', 14, 0, 100, 0, 0, 0, 4178, 0, 0, 0, 'Antu\'sul'),
(8127, 1, 0, 'Lunch has arrived, my beautiful children. Tear them to pieces!', 14, 0, 100, 0, 0, 0, 4166, 0, 0, 0, 'Antu\'sul'),
(8127, 2, 0, 'Rise and defend your master!', 14, 0, 100, 0, 0, 0, 4177, 0, 0, 0, 'Antu\'sul'),
(8201, 0, 0, 'I\'ll crush you!', 12, 0, 50, 0, 0, 0, 1925, 0, 0, 0, 'on Aggro Text'),
(8201, 0, 1, 'Me smash! You die!', 12, 0, 50, 0, 0, 0, 1926, 0, 0, 0, 'on Aggro Text'),
(8201, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 50, 0, 0, 0, 1927, 0, 0, 0, 'on Aggro Text'),
(8201, 1, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(8205, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(8567, 0, 0, 'Me smell stench of the living!', 14, 0, 100, 0, 0, 5823, 6185, 0, 0, 0, 'Glutton - SAY_AGGRO'),
(8567, 1, 0, 'Me feast on you all!', 14, 0, 100, 0, 0, 5824, 6186, 0, 0, 0, 'Glutton - SAY_SLAY'),
(8761, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(8877, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Sandfury Zealot'),
(8906, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'Ragereaver Golem'),
(8956, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(8958, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(9042, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'Verek'),
(9216, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Spirestone Warlord'),
(9259, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Firebrand Grunt'),
(9268, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Smolderthorn Berserker'),
(9454, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(9462, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(9547, 0, 0, 'Hey Nagmara!  How about a mug of Dark Iron Ale?', 12, 0, 100, 0, 0, 0, 4984, 0, 0, 0, 'Patron'),
(9547, 0, 1, 'Nagmara!  Have any mutton left?', 12, 0, 100, 0, 0, 0, 4985, 0, 0, 0, 'Patron'),
(9547, 0, 2, 'Mistress, you tell Plugger that I want more of his ale.  I can\'t get enough!', 12, 0, 100, 0, 0, 0, 4986, 0, 0, 0, 'Patron'),
(9547, 0, 3, 'Hey Nag, how about you slice me off a piece of that...', 12, 0, 100, 0, 0, 0, 4987, 0, 0, 0, 'Patron'),
(9716, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Bloodaxe Warmonger'),
(9796, 0, 0, 'Duokna... this is embarrassing.', 12, 0, 100, 0, 0, 0, 39266, 0, 0, 0, 'Galgar'),
(9796, 0, 1, 'Duokna, what are you doing?', 12, 0, 100, 0, 0, 0, 39267, 0, 0, 0, 'Galgar'),
(9796, 0, 2, 'Get down from there this instant!', 12, 0, 100, 0, 0, 0, 39268, 0, 0, 0, 'Galgar'),
(9796, 0, 3, 'How are you not burning your feet?', 12, 0, 100, 0, 0, 0, 39269, 0, 0, 0, 'Galgar'),
(10321, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(10405, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Plague Ghoul'),
(10433, 0, 0, 'We are betrayed!', 12, 0, 100, 0, 0, 0, 6234, 0, 0, 0, 'Marduk Blackpool'),
(10488, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Risen Construct'),
(10639, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Frenzied Rage'),
(10680, 0, 0, '%s summons a Blackhand Dreadweaver to his aid!', 16, 0, 100, 0, 0, 0, 5612, 0, 0, 0, 'Summoned Blackhand Dreadweaver'),
(10807, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(11058, 0, 0, 'Looking for these???? You\'ll never have em!', 12, 0, 66, 0, 0, 0, 6420, 0, 0, 0, 'Fras Siabi'),
(11058, 0, 1, 'I\'m going to wear your skin as a smoking jacket! The stogies? You\'ll have to pry them from my cold dead... er... RAWR!!!!', 12, 0, 33, 0, 0, 0, 6422, 0, 0, 0, 'Fras Siabi'),
(11142, 0, 0, 'No tampering with the mail!', 12, 0, 100, 0, 0, 0, 6470, 0, 0, 0, 'Undead Postman'),
(11360, 0, 0, '%s flees toward the safety of another tiger.', 16, 0, 100, 0, 0, 0, 10549, 0, 0, 0, 'Zulian Cub'),
(11441, 0, 0, 'Raaar!!! Me smash $r!', 12, 0, 100, 0, 0, 0, 1927, 0, 0, 0, 'Gordok Brute'),
(11441, 0, 1, 'Me smash! You die!', 12, 0, 100, 0, 0, 0, 1926, 0, 0, 0, 'Gordok Brute'),
(11441, 0, 2, 'I\'ll crush you!', 12, 0, 100, 0, 0, 0, 1925, 0, 0, 0, 'Gordok Brute'),
(11469, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Eldreth Seether'),
(11486, 0, 0, 'Who dares disrupt the sanctity of Eldre\'Thalas? Face me, cowards!', 14, 0, 100, 0, 0, 0, 9407, 0, 0, 0, 'Prince Tortheldrin'),
(11496, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Immol\'thar'),
(11501, 0, 0, 'You no challenge me, scrubs!  I\'m da king now, and I stay king FOREVER!!!', 12, 0, 100, 0, 0, 0, 9481, 0, 0, 0, 'King Gordok to Player'),
(11582, 0, 0, 'Now this is an example of what not to summon. Look, it\'s frail and brittle. One good whack from a mace will send bone shards flying.', 12, 0, 100, 0, 0, 0, 5950, 0, 0, 0, 'Scholomance Dark Summoner'),
(11582, 0, 1, 'Hmmm, this one looks like something that would be better off as a windchime. Take notes class... This is NOT what you want to summon in the heat of battle.', 12, 0, 100, 0, 0, 0, 5954, 0, 0, 0, 'Scholomance Dark Summoner'),
(11582, 0, 2, 'This one is slightly better than the last. However, it still suffers from the same flimsy bone structure as the others. When you summon one of these, you are on the right path.', 12, 0, 100, 0, 0, 0, 5952, 0, 0, 0, 'Scholomance Dark Summoner'),
(11582, 0, 3, 'Note the weak binding structure of this one. Be sure to finish your incantations or this is what you will end up with.', 12, 0, 100, 0, 0, 0, 5951, 0, 0, 0, 'Scholomance Dark Summoner'),
(11582, 0, 4, 'Wow, this one is just plain useless. Let me try again.', 12, 0, 100, 0, 0, 0, 5953, 0, 0, 0, 'Scholomance Dark Summoner'),
(11747, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Desert Rager'),
(11793, 0, 0, 'You do not belong in these gardens.  Your body shall nourish our lovely creations!', 12, 0, 100, 0, 0, 0, 8639, 0, 0, 0, 'Celebrian Dryad'),
(11793, 0, 1, 'Nothing must befoul the gardens! You must be destroyed!', 12, 0, 100, 0, 0, 0, 8640, 0, 0, 0, 'Celebrian Dryad'),
(11880, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'Twilight Avenger'),
(12347, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'Enraged Reef Crawler'),
(12636, 0, 0, 'Guards!', 14, 6, 100, 0, 0, 0, 4583, 0, 0, 0, 'Georgia'),
(12859, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(12918, 0, 0, 'You are a little gnat to the Foulweald!  Die!', 12, 0, 100, 0, 0, 0, 8350, 0, 0, 0, 'on Aggro Text'),
(12918, 1, 0, 'No!  You cannot be stronger than the Foulweald!  No!!', 12, 0, 100, 0, 0, 0, 8351, 0, 0, 0, 'on Death Text'),
(13601, 0, 0, 'Mine! Mine! Mine!  Gizlock is the ruler of this domain!  You shall never reveal my presence!', 14, 0, 100, 0, 0, 0, 8852, 0, 0, 0, 'Tinkerer Gizlock'),
(14321, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Guard Fengus'),
(14322, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Stomper Kreeg'),
(14323, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Guard Slip\'kik'),
(14325, 0, 0, 'No one get past me and threaten da king!  Ungh, take it!!', 12, 0, 100, 0, 0, 0, 9418, 0, 0, 0, 'Captain Kromcrush'),
(14325, 1, 0, 'Help me crush these punys!', 14, 0, 100, 0, 0, 0, 9478, 0, 0, 0, 'Captain Kromcrush'),
(14325, 2, 0, '%s begins to retaliate all attacks against him!', 16, 0, 100, 0, 0, 0, 9477, 0, 0, 0, 'Captain Kromcrush'),
(14326, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Guard Mol\'dar'),
(14344, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(14426, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(14435, 0, 0, 'Well done, servant. For so long I have been held captive within the prison of the Firelord. I am once more free to feast upon the out world! The land shall once more be ravaged by the force of the Wind Seeker!', 14, 0, 100, 0, 0, 0, 9570, 0, 0, 0, 'Prince Thunderaan'),
(14718, 0, 0, '%s attempts to get help!', 16, 0, 100, 0, 0, 0, 6311, 0, 0, 0, 'Horde Laborer'),
(14753, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(15542, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'Twilight Marauder'),
(15623, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(16098, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Empyrean'),
(16204, 0, 0, 'Why doesn\'t Kaendris move against Dar\'Khan yet?  What is it we\'re waiting for?', 12, 0, 100, 1, 0, 0, 12594, 0, 0, 0, 'Magister Idonis'),
(16309, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'Gangled Cannibal'),
(16328, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'Vengeful Apparition'),
(16329, 0, 0, 'Insolence!', 14, 0, 100, 0, 0, 0, 12223, 0, 0, 0, 'Dar\'Khan Drathir'),
(16523, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Shattered Hand Savage'),
(17259, 0, 0, 'This world is OURS!', 12, 0, 100, 0, 0, 0, 16702, 0, 0, 0, 'Bonechewer Hungerer'),
(17259, 0, 1, 'We are the true Horde!', 12, 0, 100, 0, 0, 0, 16697, 0, 0, 0, 'Bonechewer Hungerer'),
(17259, 0, 2, 'The blood is our power! ', 12, 0, 100, 0, 0, 0, 16700, 0, 0, 0, 'Bonechewer Hungerer'),
(17259, 0, 3, 'For Kargath!  For Victory!', 12, 0, 100, 0, 0, 0, 16698, 0, 0, 0, 'Bonechewer Hungerer - On Aggro'),
(17259, 0, 4, 'Gakarah ma!', 12, 0, 100, 0, 0, 0, 16699, 0, 0, 0, 'Bonechewer Hungerer - On Aggro'),
(17259, 0, 5, 'Lok\'tar Illadari!\n', 12, 0, 100, 0, 0, 0, 16701, 0, 0, 0, 'Bonechewer Hungerer - On Aggro'),
(17259, 0, 6, 'Lok narash!', 12, 0, 100, 0, 0, 0, 16703, 0, 0, 0, 'Bonechewer Hungerer - On Aggro'),
(17271, 0, 0, 'For Kargath!  For Victory!', 12, 0, 100, 0, 0, 0, 16698, 0, 0, 0, 'Bonechewer Destroyer'),
(17271, 0, 1, 'We are the true Horde!', 12, 0, 100, 0, 0, 0, 16697, 0, 0, 0, 'Bonechewer Destroyer'),
(17271, 0, 2, 'The blood is our power! ', 12, 0, 100, 0, 0, 0, 16700, 0, 0, 0, 'Bonechewer Destroyer'),
(17271, 0, 3, 'Gakarah ma!', 12, 0, 100, 0, 0, 0, 16699, 0, 0, 0, 'Bonechewer Destroyer - On Aggro'),
(17271, 0, 4, 'Lok\'tar Illadari!\n', 12, 0, 100, 0, 0, 0, 16701, 0, 0, 0, 'Bonechewer Destroyer - On Aggro'),
(17271, 0, 5, 'This world is OURS!', 12, 0, 100, 0, 0, 0, 16702, 0, 0, 0, 'Bonechewer Destroyer - On Aggro'),
(17271, 0, 6, 'Lok narash!', 12, 0, 100, 0, 0, 0, 16703, 0, 0, 0, 'Bonechewer Destroyer - On Aggro'),
(17281, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Bonechewer Ripper'),
(17300, 0, 0, '%s calls for help!', 16, 0, 100, 0, 0, 0, 2541, 0, 0, 0, 'emote Text'),
(17311, 0, 0, 'Daughter!', 12, 7, 100, 0, 0, 0, 13749, 0, 0, 0, 'Cowlen'),
(17312, 0, 0, 'Our house is this way, through the thicket.', 12, 7, 100, 0, 0, 0, 13744, 0, 0, 0, 'magwin SAY_START'),
(17312, 1, 0, 'Help me!', 12, 7, 100, 0, 0, 0, 13770, 0, 0, 0, 'magwin SAY_AGGRO'),
(17312, 2, 0, 'My poor family. Everything has been destroyed.', 12, 7, 100, 5, 0, 0, 13745, 0, 0, 0, 'magwin SAY_PROGRESS'),
(17312, 3, 0, 'Father! Father! You\'re alive!', 12, 7, 100, 22, 0, 0, 13746, 0, 0, 0, 'magwin SAY_END1'),
(17312, 4, 0, 'You can thank $n for getting me back here safely, father.', 12, 7, 100, 5, 0, 0, 13748, 0, 0, 0, 'magwin SAY_END2'),
(17370, 0, 0, 'Lok narash!', 12, 0, 100, 0, 0, 0, 16703, 0, 0, 0, 'Laughing Skull Enforcer'),
(17455, 0, 0, 'Intruders!  Hold them off until I can release the warhounds!', 14, 0, 100, 0, 0, 10160, 14000, 0, 0, 0, 'Bonechewer Beastmaster'),
(17621, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Heathen Guard'),
(17623, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Reaver Guard'),
(17626, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Laughing Skull Legionnaire'),
(17664, 0, 0, 'You will never take me alive!', 12, 0, 100, 0, 0, 0, 14447, 0, 0, 0, 'Matis the Cruel'),
(17664, 1, 0, '%s falls unconscious.', 16, 0, 100, 0, 0, 0, 14444, 0, 0, 0, 'Matis the Cruel'),
(17723, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Bog Giant'),
(17727, 0, 0, 'Illidan reigns! ', 12, 0, 100, 0, 0, 0, 16709, 0, 0, 0, 'Wrathfin Sentry'),
(17728, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Murkblood Tribesman'),
(17729, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Murkblood Spearman'),
(17732, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Lykul Wasp'),
(17734, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Underbog Lord'),
(17735, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Wrathfin Warrior'),
(17805, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Coilfang Slavemaster'),
(17840, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Durnholde Tracking Hound'),
(17843, 0, 0, 'I want all of your trackers out in search of the criminal, Matis the Cruel. I have given trusted agents of the Hand flare guns. Should you or one of your trackers see the flare, it means that an agent has found Matis and needs assistance. And remember, tracker, Matis is to be brought back to me alive.', 12, 7, 100, 1, 0, 0, 14454, 0, 0, 0, 'Vindicator Kuros'),
(17853, 0, 0, 'We\'ve got you now, Matis the Cruel!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Tracker of the Hand'),
(17853, 1, 0, 'Return to Kuros. I will bring him to Blood Watch.', 12, 7, 100, 0, 0, 0, 14445, 0, 0, 0, 'Tracker of the Hand'),
(17976, 0, 0, 'Step forward.  I will see that you are properly welcomed!', 14, 0, 100, 0, 0, 11071, 19936, 0, 0, 0, 'Commander Sarannis - On Aggro Say'),
(17976, 1, 0, 'Oh, stop your whimpering!', 14, 0, 100, 0, 0, 11072, 19937, 0, 0, 0, 'Commander Sarannis - On Player Death Say'),
(17976, 1, 1, 'Mission accomplished!', 14, 0, 100, 0, 0, 11073, 19938, 0, 0, 0, 'Commander Sarannis - On Player Death Say'),
(17976, 2, 0, 'You are no longer dealing with some underling!', 14, 0, 100, 0, 0, 11076, 19939, 0, 0, 0, 'Commander Sarannis - On Cast Arcane Resonance Say'),
(17976, 5, 0, 'Guards, rally!  Cut these invaders down!', 14, 0, 100, 0, 0, 11078, 19941, 0, 0, 0, 'Commander Sarannis - On HP@50% Summon Say'),
(17978, 1, 0, 'You seek a prize, eh? How about death?', 14, 0, 100, 0, 0, 11206, 20013, 0, 0, 0, 'Thorngrin the Tender - 20% Health Say'),
(17978, 2, 0, 'I hate to say I told you so...', 14, 0, 100, 0, 0, 11207, 20014, 0, 0, 0, 'Thorngrin the Tender - Player Death Say'),
(17978, 3, 0, 'Your life will be mine!', 14, 0, 100, 0, 0, 11208, 20015, 0, 0, 0, 'Thorngrin the Tender - Cast Sacrifice Say'),
(17978, 4, 0, 'I revel in your pain!', 14, 0, 100, 0, 0, 11209, 20016, 0, 0, 0, 'Thorngrin the Tender - 50% Health Say'),
(17978, 5, 0, 'I\'ll incinerate you!', 14, 0, 100, 0, 0, 11210, 20017, 0, 0, 0, 'Thorngrin the Tender - Cast Hellfire Say'),
(17978, 5, 1, 'Scream while you burn!', 14, 0, 100, 0, 0, 11211, 20018, 0, 0, 0, 'Thorngrin the Tender - Cast Hellfire Say'),
(17978, 6, 0, 'You won\'t... get far.', 14, 0, 100, 0, 0, 11212, 20019, 0, 0, 0, 'Thorngrin the Tender - On Death Say'),
(17978, 7, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Thorngrin the Tender - On Enrage Say'),
(18105, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Ghaz\'an'),
(18311, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Ethereal Crypt Raider'),
(18322, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Sethekk Ravenguard'),
(18632, 0, 0, 'Ruin finds us all!', 12, 0, 100, 0, 0, 0, 16798, 0, 0, 0, 'Cabal Executioner'),
(18632, 0, 1, 'In Sargeras\' name!', 12, 0, 100, 0, 0, 0, 16799, 0, 0, 0, 'Cabal Executioner'),
(18632, 0, 2, 'The end comes for you!', 12, 0, 100, 0, 0, 0, 16800, 0, 0, 0, 'Cabal Executioner'),
(18632, 0, 3, 'I do as I must!', 12, 0, 100, 0, 0, 0, 16801, 0, 0, 0, 'Cabal Executioner'),
(18632, 0, 4, 'The Legion reigns!', 12, 0, 100, 0, 0, 0, 16802, 0, 0, 0, 'Cabal Executioner'),
(18632, 0, 5, 'I shall be rewarded!', 12, 0, 100, 0, 0, 0, 16803, 0, 0, 0, 'Cabal Executioner'),
(18635, 0, 0, 'Ruin finds us all!', 12, 0, 100, 0, 0, 0, 16798, 0, 0, 0, 'Cabal Deathsworn'),
(18635, 0, 1, 'In Sargeras\' name!', 12, 0, 100, 0, 0, 0, 16799, 0, 0, 0, 'Cabal Deathsworn'),
(18635, 0, 2, 'The end comes for you!', 12, 0, 100, 0, 0, 0, 16800, 0, 0, 0, 'Cabal Deathsworn'),
(18635, 0, 3, 'I do as I must!', 12, 0, 100, 0, 0, 0, 16801, 0, 0, 0, 'Cabal Deathsworn'),
(18635, 0, 4, 'The Legion reigns!', 12, 0, 100, 0, 0, 0, 16802, 0, 0, 0, 'Cabal Deathsworn'),
(18635, 0, 5, 'I shall be rewarded!', 12, 0, 100, 0, 0, 0, 16803, 0, 0, 0, 'Cabal Deathsworn'),
(18638, 0, 0, 'Ruin finds us all!', 12, 0, 100, 0, 0, 0, 16798, 0, 0, 0, 'Cabal Zealot'),
(18638, 0, 1, 'In Sargeras\' name!', 12, 0, 100, 0, 0, 0, 16799, 0, 0, 0, 'Cabal Zealot'),
(18638, 0, 2, 'The end comes for you!', 12, 0, 100, 0, 0, 0, 16800, 0, 0, 0, 'Cabal Zealot'),
(18638, 0, 3, 'I do as I must!', 12, 0, 100, 0, 0, 0, 16801, 0, 0, 0, 'Cabal Zealot'),
(18638, 0, 4, 'The Legion reigns!', 12, 0, 100, 0, 0, 0, 16802, 0, 0, 0, 'Cabal Zealot'),
(18638, 0, 5, 'I shall be rewarded!', 12, 0, 100, 0, 0, 0, 16803, 0, 0, 0, 'Cabal Zealot'),
(18995, 0, 0, 'Death to the Last Guardian!', 12, 0, 100, 0, 0, 0, 15171, 0, 0, 0, 'Infinite Vanquisher - On Aggro'),
(18995, 0, 1, 'You will not stand in our way!', 12, 0, 100, 0, 0, 0, 15172, 0, 0, 0, 'Infinite Vanquisher - On Aggro'),
(18995, 0, 2, 'Magna Medivh dies today!', 12, 0, 100, 0, 0, 0, 15173, 0, 0, 0, 'Infinite Vanquisher - On Aggro'),
(19209, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'Summoned Cabal Deathsworn'),
(19218, 3, 0, 'An unforeseen... contingency.', 14, 0, 100, 0, 0, 11106, 20039, 0, 0, 0, 'Gatewatcher Gyro-Kill - On Death'),
(19219, 3, 1, 'Damn, I\'m good!', 14, 0, 100, 0, 0, 11164, 19954, 0, 0, 0, 'Mechano-Lord Capacitus - Killing a player'),
(19219, 3, 0, 'Can\'t say I didn\'t warn you....', 14, 0, 100, 0, 0, 11163, 19953, 0, 0, 0, 'Mechano-Lord Capacitus - Killing a player'),
(19632, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Lykul Stinger'),
(21694, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 24144, 0, 0, 0, 'Bog Overlord'),
(22259, 0, 0, 'Your end has come!', 12, 0, 100, 0, 0, 0, 53515, 0, 0, 0, 'Hellfire Wardling'),
(22259, 0, 1, 'An intruder!  Begone!', 12, 0, 100, 0, 0, 0, 20027, 0, 0, 0, 'Hellfire Wardling'),
(22259, 0, 2, 'An intruder!  Begone!', 12, 0, 100, 0, 0, 8152, 20027, 0, 0, 0, 'Hellfire Wardling'),
(22259, 0, 3, 'You will burn!', 12, 0, 100, 0, 0, 0, 53513, 0, 0, 0, 'Hellfire Wardling'),
(22259, 0, 4, 'Die!', 12, 0, 100, 0, 0, 0, 53514, 0, 0, 0, 'Hellfire Wardling'),
(22259, 0, 5, 'Your end has come!', 12, 0, 100, 0, 0, 8152, 53515, 0, 0, 0, 'Hellfire Wardling'),
(22259, 0, 6, 'Die!', 12, 0, 100, 0, 0, 8152, 53514, 0, 0, 0, 'Hellfire Wardling'),
(22273, 0, 0, 'Die, interloper!  Your puny device cannot pierce the dark magics of Hellfire Citadel!', 12, 0, 100, 397, 0, 0, 20020, 0, 0, 0, 'Fel Warden'),
(23597, 0, 0, 'More intruders! Sound da alarm!', 14, 0, 100, 25, 0, 12104, 23252, 0, 0, 0, 'Amani\'shi Guardian'),
(23618, 0, 2, 'Where is that dog?', 12, 0, 50, 1, 0, 0, 22166, 0, 0, 0, 'say Text'),
(23618, 0, 1, 'I miss my dog so much!', 12, 0, 50, 1, 0, 0, 22168, 0, 0, 0, 'say Text'),
(23618, 0, 0, 'Will you help me find my dog?', 12, 0, 50, 1, 0, 0, 22167, 0, 0, 0, 'say Text'),
(23651, 0, 0, 'Suffer, insect!', 12, 0, 100, 0, 0, 0, 22701, 0, 0, 0, 'Dragonflayer Tribesman'),
(23651, 0, 1, 'My life for Ymiron!', 12, 0, 100, 0, 0, 0, 22702, 0, 0, 0, 'Dragonflayer Tribesman'),
(23651, 0, 2, 'For Ymiron!', 12, 0, 100, 0, 0, 0, 22697, 0, 0, 0, 'Dragonflayer Tribesman'),
(23651, 0, 3, 'Beg for your life...', 12, 0, 100, 0, 0, 0, 22698, 0, 0, 0, 'Dragonflayer Tribesman'),
(23651, 0, 4, 'Your end draws closer!', 12, 0, 100, 0, 0, 0, 22699, 0, 0, 0, 'Dragonflayer Tribesman'),
(23651, 0, 5, 'YAAARRRGH!', 12, 0, 100, 0, 0, 0, 22700, 0, 0, 0, 'Dragonflayer Tribesman'),
(23671, 0, 0, 'You think I do not know what you are trying to do? You think I haven\'t been watching you?', 14, 0, 100, 1, 0, 0, 22787, 0, 0, 0, 'Halfdan the Ice-Hearted'),
(23678, 1, 0, 'I knew Lurielle would send help! Thank you, friend, and give Lurielle my thanks as well!', 12, 0, 100, 1, 0, 0, 23044, 0, 0, 0, 'Chill Nymph'),
(23678, 1, 1, 'Where am I? What happened to me? You... you freed me?', 12, 0, 100, 1, 0, 0, 23043, 0, 0, 0, 'Chill Nymph'),
(23678, 1, 2, 'Thank you. I thought I would die without seeing my sisters again!', 12, 0, 100, 1, 0, 0, 23042, 0, 0, 0, 'Chill Nymph'),
(23863, 7, 0, 'Ya don\' have to look to da sky to see da dragonhawk!', 14, 0, 100, 0, 0, 24223, 23178, 0, 0, 0, 'Daakara - SAY_TRANSFORMS_DRAGONHAWK'),
(24014, 0, 0, 'You too will serve the Lich King.', 12, 0, 100, 0, 0, 0, 23663, 0, 0, 0, 'Necrolord'),
(24014, 0, 1, 'There\'s always room for one more.', 12, 0, 100, 0, 0, 13542, 23669, 0, 0, 0, 'Necrolord'),
(24014, 0, 2, 'Your life for the Lich King!', 12, 0, 100, 0, 0, 0, 23667, 0, 0, 0, 'Necrolord'),
(24014, 0, 3, 'So eager to die are we?', 12, 0, 100, 0, 0, 0, 23662, 0, 0, 0, 'Necrolord'),
(24014, 0, 4, 'Hello, little one. Come to play?', 12, 0, 100, 0, 0, 0, 23666, 0, 0, 0, 'Necrolord'),
(24014, 0, 5, 'I have so many wonders to show you.', 12, 0, 100, 0, 0, 0, 23668, 0, 0, 0, 'Necrolord'),
(24014, 0, 6, 'Excellent, another sacrificial lamb.', 12, 0, 100, 0, 0, 0, 23661, 0, 0, 0, 'Necrolord'),
(24014, 0, 7, 'There\'s always room for one more.', 12, 0, 100, 0, 0, 0, 23669, 0, 0, 0, 'Necrolord'),
(24014, 0, 8, 'Plucked ripe off the vine.', 12, 0, 100, 0, 0, 0, 23678, 0, 0, 0, 'Necrolord'),
(24078, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Dragonflayer Metalworker'),
(24398, 0, 0, 'Yeouch! Watch where you throw that stuff!', 14, 7, 100, 0, 0, 0, 23370, 0, 0, 0, 'Steel Gate Excavator'),
(24531, 0, 0, 'Yes, darling. You realize you\'ll be eating dire ram mutton for dinner until the crops are planted...', 12, 7, 100, 1, 0, 0, 23608, 0, 0, 0, 'Gavin Ward'),
(24531, 1, 0, 'I\'d rather listen to his braying than yours, dear.', 12, 7, 100, 0, 0, 0, 23610, 0, 0, 0, 'Gavin Ward'),
(24531, 2, 0, 'Of course, darling.', 12, 7, 100, 1, 0, 0, 23606, 0, 0, 0, 'Gavin Ward'),
(24635, 0, 0, 'Suffer, insect!', 12, 0, 100, 0, 0, 0, 22701, 0, 0, 0, 'Dragonflayer Harpooner'),
(24635, 0, 1, 'My life for Ymiron!', 12, 0, 100, 0, 0, 0, 22702, 0, 0, 0, 'Dragonflayer Harpooner'),
(24635, 0, 2, 'For Ymiron!', 12, 0, 100, 0, 0, 0, 22697, 0, 0, 0, 'Dragonflayer Harpooner'),
(24635, 0, 3, 'Beg for your life...', 12, 0, 100, 0, 0, 0, 22698, 0, 0, 0, 'Dragonflayer Harpooner'),
(24635, 0, 4, 'Your end draws closer!', 12, 0, 100, 0, 0, 0, 22699, 0, 0, 0, 'Dragonflayer Harpooner'),
(24635, 0, 5, 'YAAARRRGH!', 12, 0, 100, 0, 0, 0, 22700, 0, 0, 0, 'Dragonflayer Harpooner'),
(24830, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Stonevault Pillager'),
(24960, 0, 0, 'The rift\'s power is ours!', 12, 10, 100, 0, 0, 0, 24003, 0, 0, 0, 'Wretched Devourer'),
(24960, 0, 1, 'Get away, this place is ours!', 12, 10, 100, 0, 0, 0, 24004, 0, 0, 0, 'Wretched Devourer'),
(24960, 0, 2, 'Mine! You shall not take this place!', 12, 10, 100, 0, 0, 0, 24005, 0, 0, 0, 'Wretched Devourer'),
(24960, 0, 3, 'It\'s not meant for you! Get away from here!', 12, 10, 100, 0, 0, 0, 24006, 0, 0, 0, 'Wretched Devourer'),
(24966, 0, 0, 'The rift\'s power is ours!', 12, 10, 100, 0, 0, 0, 24003, 0, 0, 0, 'Wretched Devourer'),
(24966, 0, 1, 'Get away, this place is ours!', 12, 10, 100, 0, 0, 0, 24004, 0, 0, 0, 'Wretched Devourer'),
(24966, 0, 2, 'Mine! You shall not take this place!', 12, 10, 100, 0, 0, 0, 24005, 0, 0, 0, 'Wretched Devourer'),
(24966, 0, 3, 'It\'s not meant for you! Get away from here!', 12, 10, 100, 0, 0, 0, 24006, 0, 0, 0, 'Wretched Devourer'),
(24972, 0, 0, 'Core overload detected. System malfunction detected...', 12, 0, 100, 0, 0, 0, 24008, 0, 0, 0, 'Erratic Sentry'),
(25242, 0, 0, '$g Sir:Ma\'am;, my life for the Horde!', 12, 1, 100, 0, 0, 0, 25267, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 1, 'Welcome back, champion.', 12, 1, 100, 0, 0, 0, 25268, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 2, 'It is an honor to serve along your side, $g sir:ma\'am;.', 12, 1, 100, 0, 0, 0, 25269, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 3, 'Lok\'tar ogar!', 12, 1, 100, 0, 0, 0, 25270, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 4, 'Throm-Ka, hero!', 12, 1, 100, 0, 0, 0, 25271, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 5, 'With your strength and determination, we cannot fail!', 12, 1, 100, 0, 0, 0, 25272, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 6, 'There walks a hero!', 12, 1, 100, 0, 0, 0, 25273, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 7, 'It\'s $n! Bow your heads!', 12, 1, 100, 0, 0, 0, 25274, 0, 0, 0, 'Warsong Battleguard'),
(25242, 0, 8, '%s cheers at you.', 16, 1, 100, 0, 0, 0, 25275, 0, 0, 0, 'Warsong Battleguard'),
(25243, 0, 0, '$g Sir:Ma\'am;, my life for the Horde!', 12, 1, 100, 0, 0, 0, 25267, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 1, 'Welcome back, champion.', 12, 1, 100, 0, 0, 0, 25268, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 2, 'It is an honor to serve along your side, $g sir:ma\'am;.', 12, 1, 100, 0, 0, 0, 25269, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 3, 'Lok\'tar ogar!', 12, 1, 100, 0, 0, 0, 25270, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 4, 'Throm-Ka, hero!', 12, 1, 100, 0, 0, 0, 25271, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 5, 'With your strength and determination, we cannot fail!', 12, 1, 100, 0, 0, 0, 25272, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 6, 'There walks a hero!', 12, 1, 100, 0, 0, 0, 25273, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 7, 'It\'s $n! Bow your heads!', 12, 1, 100, 0, 0, 0, 25274, 0, 0, 0, 'Warsong Honor Guard'),
(25243, 0, 8, '%s cheers at you.', 16, 1, 100, 0, 0, 0, 25275, 0, 0, 0, 'Warsong Honor Guard'),
(25244, 0, 0, 'Captain... Nerub\'ar flyers! Hundreds of \'em! Coming... Coming from the south! Over our defenses!', 14, 1, 100, 0, 0, 0, 24653, 0, 0, 0, 'Warsong Marksman'),
(253, 0, 0, 'This shouldn\'t take long...', 12, 0, 100, 432, 0, 0, 1851, 0, 0, 0, 'William Pestle'),
(25428, 0, 0, 'Kada nu batteka, oht!', 12, 0, 100, 0, 0, 0, 24652, 0, 0, 0, 'Magmoth Shaman'),
(25428, 0, 1, 'Etu Magmothregar, cha!', 12, 0, 100, 0, 0, 0, 24650, 0, 0, 0, 'Magmoth Shaman'),
(25428, 0, 2, 'KAGANISHU!', 12, 0, 100, 0, 0, 0, 24658, 0, 0, 0, 'Magmoth Shaman'),
(25428, 0, 3, 'Grr... na su ka Magmoth!', 12, 0, 100, 0, 0, 0, 24651, 0, 0, 0, 'Magmoth Shaman - On Aggro'),
(25429, 0, 0, 'Kada nu batteka, oht!', 12, 0, 100, 0, 0, 0, 24652, 0, 0, 0, 'Magmoth Forager'),
(25429, 0, 1, 'Etu Magmothregar, cha!', 12, 0, 100, 0, 0, 0, 24650, 0, 0, 0, 'Magmoth Forager'),
(25429, 0, 2, 'KAGANISHU!', 12, 0, 100, 0, 0, 0, 24658, 0, 0, 0, 'Magmoth Forager'),
(25429, 0, 3, 'Grr... na su ka Magmoth!', 12, 0, 100, 0, 0, 0, 24651, 0, 0, 0, 'Magmoth Forager - On Aggro'),
(25432, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Mate of Magmothregar'),
(25467, 0, 0, 'No hurt the lifegiver!', 12, 0, 100, 0, 0, 0, 24689, 0, 0, 0, 'Bloodspore Harvester'),
(25467, 0, 1, 'No touch spores!', 12, 0, 100, 0, 0, 0, 24690, 0, 0, 0, 'Bloodspore Harvester'),
(25470, 0, 0, 'No hurt the lifegiver!', 12, 0, 100, 0, 0, 0, 24689, 0, 0, 0, 'Bloodspore Firestarter'),
(25470, 1, 0, 'Protect the lifegiver!', 14, 0, 100, 0, 0, 0, 24695, 0, 0, 0, 'Bloodspore Firestarter'),
(25682, 0, 0, 'You cannot stop us!', 12, 0, 100, 0, 0, 0, 24875, 0, 0, 0, 'Lich-Lord Chillwinter'),
(25682, 0, 1, 'Die!', 12, 0, 100, 0, 0, 0, 24874, 0, 0, 0, 'Lich-Lord Chillwinter - On Aggro'),
(25682, 0, 2, 'Filthy breather!', 12, 0, 100, 0, 0, 0, 24876, 0, 0, 0, 'Lich-Lord Chillwinter - On Aggro'),
(25836, 0, 0, 'Mother of pearl!', 12, 0, 100, 0, 0, 0, 25037, 0, 0, 0, 'Loot Crazed Diver'),
(25836, 0, 1, 'Clam skin dress shirt here I come!', 12, 0, 100, 0, 0, 0, 25038, 0, 0, 0, 'Loot Crazed Diver'),
(25836, 0, 2, 'The clam has given up the goods!', 12, 0, 100, 0, 0, 0, 25039, 0, 0, 0, 'Loot Crazed Diver'),
(25836, 0, 3, 'BAM!', 12, 0, 100, 0, 0, 0, 25040, 0, 0, 0, 'Loot Crazed Diver'),
(25949, 0, 0, 'These stones should be the last of them. Our coordination with Neptulon\'s forces will be impeccable.', 12, 0, 100, 1, 0, 0, 25123, 0, 0, 0, 'Briatha'),
(25951, 0, 0, 'Yess. The Tidehunter will be pleased at this development. The Firelord\'s hold will weaken.', 12, 0, 100, 1, 0, 0, 25124, 0, 0, 0, 'Heretic Emissary'),
(25979, 0, 0, 'Now THIS is a sport!', 12, 0, 100, 0, 0, 0, 25022, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 1, 'KILL KILL KILL!!!!!!!', 12, 0, 100, 0, 0, 0, 25019, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 2, 'I\'m sure ol\' Hemet can do something with your bones!', 12, 0, 100, 0, 0, 0, 25017, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 3, 'Give it up, little beast!', 12, 0, 100, 0, 0, 0, 25023, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 4, 'Just fifty more hooves and I\'ll have the new gun!', 12, 0, 100, 0, 0, 0, 25018, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 5, 'No way! Rhino head helmet for the low, low price of thirty rhino heads? I\'ll take two at those prices!', 12, 0, 100, 0, 0, 0, 25116, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 6, 'I wonder what Nesingwary will give me for your hide!', 12, 0, 100, 0, 0, 0, 25016, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 7, 'It\'s gonna be veal tonight!', 12, 0, 100, 0, 0, 0, 25020, 0, 0, 0, 'Loot Crazed Hunter'),
(25979, 0, 8, 'Nesingwary is going to go broke if he keeps this up! Lane probably has no idea what he\'s doing!', 12, 0, 100, 0, 0, 0, 25117, 0, 0, 0, 'Loot Crazed Hunter'),
(26196, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Loguhn'),
(26199, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Snowfall Glade Den Mother'),
(26762, 0, 0, 'Keep them away from the focus!', 12, 0, 100, 0, 0, 0, 25934, 0, 0, 0, 'Captain Emmy Malin'),
(26798, 0, 0, 'What is this? Mok-thorin ka! Kill them!', 14, 0, 100, 0, 0, 13458, 29622, 0, 0, 0, 'Commander Kolurg'),
(26798, 1, 0, 'Our task is not yet done!', 14, 0, 100, 0, 0, 13459, 29623, 0, 0, 0, 'Commander Kolurg'),
(26798, 2, 0, 'Gaagh...', 14, 0, 100, 0, 0, 13460, 29624, 0, 0, 0, 'Commander Kolurg'),
(26815, 0, 0, 'Ya shouldn\'a taken the boat north, mon!', 12, 0, 100, 0, 0, 0, 25993, 0, 0, 0, 'Lieutenant Ta\'zinni'),
(27246, 0, 0, 'It is good that you have come my child.  The Light\'s protection has worn thin on you.', 12, 0, 100, 0, 0, 0, 26271, 0, 0, 0, 'Bishop Street'),
(27551, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Enraged Apparition'),
(27588, 0, 0, 'Without you we\'d be lost. Thanks for the ride!', 12, 7, 100, 0, 0, 0, 26844, 0, 0, 0, '7th Legion Elite'),
(27588, 0, 1, 'For the Alliance and Lord Fordragon!', 12, 7, 100, 0, 0, 0, 26841, 0, 0, 0, '7th Legion Elite'),
(27588, 0, 2, 'HOO-WAH! The cavalry has arrived!', 12, 7, 100, 0, 0, 0, 26842, 0, 0, 0, '7th Legion Elite'),
(27588, 0, 3, 'Great driving, soldier! Not a scratch on us!', 12, 7, 100, 0, 0, 0, 26843, 0, 0, 0, '7th Legion Elite'),
(27683, 0, 0, 'I\'ve lived here and kept this shrine with the blessing of the Alexstrasza for longer than I can remember.  In its darkest hour, I\'ve failed... I fell at the feet of that damned death knight...  Bloodbane.', 12, 0, 100, 0, 0, 0, 26939, 0, 0, 0, 'Remnant of Dahlia Suntouch'),
(27683, 1, 0, 'Dahlia spits on the ground at the thought of the name.', 16, 0, 100, 0, 0, 0, 26943, 0, 0, 0, 'Remnant of Dahlia Suntouch'),
(27683, 2, 0, 'The Lich King is stretching his hand far now... fearlessly treading on the most sacred lands of all of the flights.  He intends to force us to action.', 12, 0, 100, 0, 0, 0, 26940, 0, 0, 0, 'Remnant of Dahlia Suntouch'),
(27683, 3, 0, 'My time is done... I offered myself to Alexstrasza in life, but I have nothing left to offer in death.  She will need a new keeper for her shrine.', 12, 0, 100, 0, 0, 0, 26941, 0, 0, 0, 'Remnant of Dahlia Suntouch'),
(27683, 4, 0, 'And thank you... thank you for freeing me from the shackles of the damned.  You are a hero... I know you will go on to great deeds.', 12, 0, 100, 0, 0, 0, 26942, 0, 0, 0, 'Remnant of Dahlia Suntouch'),
(27683, 5, 0, 'The Remnant of Dahlia Suntouch fades away...', 16, 0, 100, 0, 0, 0, 26944, 0, 0, 0, 'Remnant of Dahlia Suntouch'),
(27713, 0, 0, 'What is it?', 12, 0, 100, 0, 0, 0, 27143, 0, 0, 0, '7th Legion Elite'),
(27713, 0, 1, 'Is this the end? If we stop this bastard now, is victory assured at the Wrathgate?', 12, 0, 100, 0, 0, 0, 27146, 0, 0, 0, '7th Legion Elite'),
(27713, 0, 2, 'Let it be known that it has been an honor and a privilege fighting alongside all of you.', 12, 0, 100, 0, 0, 0, 27148, 0, 0, 0, '7th Legion Elite'),
(27713, 0, 3, 'Death comes for us all eventually, but sometimes it comes a little faster than anticipated. Today we call that blind heroics... Tomorrow someone may call it stupidity.', 12, 0, 100, 0, 0, 0, 27150, 0, 0, 0, '7th Legion Elite'),
(27713, 0, 4, 'Come on... Let\'s get this over with!', 12, 0, 100, 0, 0, 0, 27149, 0, 0, 0, '7th Legion Elite'),
(27713, 0, 5, 'It looks like a gateway to hell!', 12, 0, 100, 0, 0, 0, 27144, 0, 0, 0, '7th Legion Elite'),
(27713, 0, 6, 'I\'m getting a little worried. Where is this hero that is supposed to lead us into battle?', 12, 0, 100, 0, 0, 0, 27147, 0, 0, 0, '7th Legion Elite'),
(27713, 0, 7, 'If I don\'t make it back to Wintergarde, let my family know that I did my best and that I love them...', 12, 0, 100, 0, 0, 0, 27145, 0, 0, 0, '7th Legion Elite'),
(27871, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Flesheating Ghoul'),
(27986, 0, 0, 'Aye, I\'ll try it.', 12, 0, 100, 273, 0, 0, 28549, 0, 0, 0, 'Hemet Nesingwary'),
(28076, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Frenzyheart Berserker'),
(28078, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Frenzyheart Ravager'),
(28095, 0, 0, 'No! You steal kill! Now you owe Gekgek!', 12, 0, 100, 0, 0, 0, 27605, 0, 0, 0, 'Tracker Gekgek'),
(28103, 0, 0, 'Urgreth begins to emanate a powerful dark energy!', 16, 0, 100, 0, 0, 0, 29932, 0, 0, 0, 'Urgreth of the Thousand Tombs'),
(28105, 0, 0, 'My treasure! You no steal from Tartek, dumb big-tongue traitor thing.', 14, 0, 100, 0, 0, 0, 27893, 0, 0, 0, 'Warlord Tartek'),
(28474, 0, 0, 'Step forth disciple. Show me what you have learned.', 12, 0, 100, 0, 0, 0, 29664, 0, 0, 0, 'Amal\'thazad'),
(28474, 0, 1, 'It is time for your learning to be put to the test. Step forth.', 12, 0, 100, 0, 0, 0, 29667, 0, 0, 0, 'Amal\'thazad'),
(28474, 0, 2, 'Do not let the ice in your blood slow your step. Prove your prowess, disciple.', 12, 0, 100, 0, 0, 0, 29668, 0, 0, 0, 'Amal\'thazad'),
(28474, 0, 3, 'You have stood and listened long enough. Step forth.', 12, 0, 100, 0, 0, 0, 29669, 0, 0, 0, 'Amal\'thazad'),
(28474, 0, 4, 'Prove that you understand my teachings, disciple.', 12, 0, 100, 0, 0, 0, 29670, 0, 0, 0, 'Amal\'thazad'),
(28474, 0, 5, 'It is time for your challenge disciple. Use my teachings well.', 12, 0, 100, 0, 0, 0, 29671, 0, 0, 0, 'Amal\'thazad'),
(28474, 1, 0, 'Its spells would be less threatening if its incantations were slowed by your icy touch...', 12, 0, 100, 0, 0, 0, 29665, 0, 0, 0, 'Amal\'thazad'),
(28474, 2, 1, 'Do not let it consider its next spell so freely, disciple... freeze its mind.', 12, 0, 100, 0, 0, 0, 29666, 0, 0, 0, 'Amal\'thazad'),
(28474, 3, 0, 'You are not overwhelmed just yet disciple... let the hungering cold of death halt this onslaught.', 12, 0, 100, 0, 0, 0, 29673, 0, 0, 0, 'Amal\'thazad'),
(28474, 4, 1, 'Frozen solid, ripe for the slaughter. Let loose a howling blast and shatter them into pieces, disciple.', 12, 0, 100, 0, 0, 0, 29674, 0, 0, 0, 'Amal\'thazad'),
(28474, 5, 0, 'Do not be frightened child... welcome the cold embrace of death...', 12, 0, 100, 0, 0, 0, 29836, 0, 0, 0, 'Amal\'thazad'),
(28474, 5, 1, 'Such is the price of failure.', 12, 0, 100, 0, 0, 0, 29837, 0, 0, 0, 'Amal\'thazad'),
(28474, 5, 2, 'Death is the reward for your weakness.', 12, 0, 100, 0, 0, 0, 29838, 0, 0, 0, 'Amal\'thazad'),
(28474, 5, 3, 'Your retention was poor.', 12, 0, 100, 0, 0, 0, 29839, 0, 0, 0, 'Amal\'thazad'),
(28557, 0, 0, 'Ungh... I... I think I pooped...', 12, 0, 100, 0, 0, 0, 29015, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 1, 'I... I got a sick grandma at home... I... I\'m all she\'s got, $g mister:miss;.', 12, 0, 100, 0, 0, 0, 29016, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 2, 'I picked the wrong week to quit drinkin\'!', 12, 0, 100, 0, 0, 0, 29014, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 3, 'I\'ve got five kids, $g man:lady;! They\'ll die without me!', 12, 0, 100, 0, 0, 0, 29012, 0, 0, 0, 'Scarlet Peasant'),
(28557, 0, 4, 'You don\'t have to do this! Nobody has to die!', 12, 0, 100, 0, 0, 0, 29013, 0, 0, 0, 'Scarlet Peasant'),
(28575, 0, 0, 'Filthy $r intruder. DIE!', 12, 0, 100, 0, 0, 0, 28539, 0, 0, 0, 'Rhunok\'s Tormentor'),
(28575, 0, 1, 'If Rhunok regains his strength, we all die!', 12, 0, 100, 0, 0, 0, 27908, 0, 0, 0, 'Rhunok\'s Tormentor'),
(28575, 0, 2, 'There are intruders about. Slay them before they ruin everything!', 12, 0, 100, 0, 0, 0, 27910, 0, 0, 0, 'Rhunok\'s Tormentor'),
(28575, 0, 3, 'The bear god must be kept enfeebled so that the prophet can finish the ritual.', 12, 0, 100, 0, 0, 0, 27909, 0, 0, 0, 'Rhunok\'s Tormentor'),
(28575, 0, 4, 'Keep him weak!', 12, 0, 100, 0, 0, 0, 27907, 0, 0, 0, 'Rhunok\'s Tormentor'),
(28601, 0, 0, 'Fool!  You led us to the only being that could stand up to our armies!  You will never bring the Etymidian back to Northrend!', 12, 0, 100, 25, 0, 0, 29968, 0, 0, 0, 'High Cultist Herenn'),
(28890, 0, 0, 'Rise, minion. Rise and fly for the Scourge!', 12, 0, 100, 5, 0, 0, 29045, 0, 0, 0, 'Gothik the Harvester'),
(28890, 0, 1, 'You will fly again, beast...', 12, 0, 100, 5, 0, 0, 29043, 0, 0, 0, 'Gothik the Harvester'),
(28917, 0, 0, 'Daddy!', 12, 0, 100, 0, 0, 0, 29007, 0, 0, 0, 'Yara'),
(29028, 0, 0, 'What is this? I recognize you from when I killed Akali. You must be this $n that everyone is dreading.', 14, 0, 100, 25, 0, 12009, 29250, 0, 0, 0, 'Prophet of Akali'),
(29112, 0, 0, 'Flattery will get you nowhere.', 12, 0, 100, 1, 0, 0, 29650, 0, 0, 0, 'Gothik the Harvester'),
(29112, 1, 0, 'Don\'t be ridiculous. Where would you even go if I did spare you? We just finished eradicating your civilization, remember?', 12, 0, 100, 1, 0, 0, 29651, 0, 0, 0, 'Gothik the Harvester'),
(29112, 2, 0, 'Oh yes. Immensely. The pain will probably render you unconscious - hence the vat of slime you\'re floating in!', 12, 0, 100, 1, 0, 0, 29647, 0, 0, 0, 'Gothik the Harvester'),
(29112, 3, 0, 'That\'s how you know it\'s working.', 12, 0, 100, 1, 0, 0, 29648, 0, 0, 0, 'Gothik the Harvester'),
(29112, 4, 0, 'You idiot! That\'s What I\'m Doing Right Now!', 12, 0, 100, 5, 0, 0, 0, 0, 0, 0, 'Gothik the Harvester'),
(29112, 5, 0, 'I AM going to kill you. What\'s the rush?', 12, 0, 100, 6, 0, 0, 29649, 0, 0, 0, 'Gothik the Harvester'),
(29193, 0, 0, 'You\'re a monster!', 12, 0, 100, 0, 0, 0, 29644, 0, 0, 0, 'Scarlet Deserter'),
(29193, 1, 0, 'Please! Spare me! I...', 12, 0, 100, 0, 0, 0, 29645, 0, 0, 0, 'Scarlet Deserter'),
(29193, 2, 0, 'Wi... Will it hurt?', 12, 0, 100, 0, 0, 0, 29641, 0, 0, 0, 'Scarlet Deserter'),
(29193, 3, 0, 'It tingles...', 12, 0, 100, 0, 0, 0, 29642, 0, 0, 0, 'Scarlet Deserter'),
(29193, 4, 0, 'Why don\'t you Just Kill me Already', 12, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Deserter'),
(29193, 5, 0, 'Is it too late to change my mind? How about you just kill me instead?', 12, 0, 100, 0, 0, 0, 29643, 0, 0, 0, 'Scarlet Deserter'),
(29193, 6, 0, 'The horror! THE HORROR!', 12, 0, 100, 0, 0, 0, 29646, 0, 0, 0, 'Scarlet Deserter'),
(29437, 0, 0, 'You go now, bad troll!', 12, 0, 100, 0, 0, 0, 30336, 0, 0, 0, 'Rageclaw Berserker'),
(29437, 0, 1, 'Why you hurt Rageclaw? You crazy?', 12, 0, 100, 0, 0, 0, 30337, 0, 0, 0, 'Rageclaw Berserker'),
(29437, 0, 2, 'Rageclaw and troll friends no more!', 12, 0, 100, 0, 0, 0, 30338, 0, 0, 0, 'Rageclaw Berserker'),
(29437, 0, 3, 'You kill our pups! We kill you back!', 12, 0, 100, 0, 0, 0, 30339, 0, 0, 0, 'Rageclaw Berserker'),
(29437, 0, 4, 'You leave den the hard way!', 12, 0, 100, 0, 0, 0, 30340, 0, 0, 0, 'Rageclaw Berserker'),
(29437, 0, 5, 'You hurted the chief\'s lion seal! WHY YOU HURT LION SEAL??!', 12, 0, 100, 0, 0, 0, 30341, 0, 0, 0, 'Rageclaw Berserker'),
(29437, 0, 6, 'Why you smell so bad now? You smelled much less bad before!', 12, 0, 100, 0, 0, 0, 30342, 0, 0, 0, 'Rageclaw Berserker'),
(29437, 0, 7, 'Trolls is shameful. Trolls is killers!', 12, 0, 100, 0, 0, 0, 30343, 0, 0, 0, 'Rageclaw Berserker'),
(29439, 0, 0, 'You go now, bad troll!', 12, 0, 100, 0, 0, 0, 30336, 0, 0, 0, 'Rageclaw Hunter'),
(29439, 0, 1, 'Why you hurt Rageclaw? You crazy?', 12, 0, 100, 0, 0, 0, 30337, 0, 0, 0, 'Rageclaw Hunter'),
(29439, 0, 2, 'Rageclaw and troll friends no more!', 12, 0, 100, 0, 0, 0, 30338, 0, 0, 0, 'Rageclaw Hunter'),
(29439, 0, 3, 'You kill our pups! We kill you back!', 12, 0, 100, 0, 0, 0, 30339, 0, 0, 0, 'Rageclaw Hunter'),
(29439, 0, 4, 'You leave den the hard way!', 12, 0, 100, 0, 0, 0, 30340, 0, 0, 0, 'Rageclaw Hunter'),
(29439, 0, 5, 'You hurted the chief\'s lion seal! WHY YOU HURT LION SEAL??!', 12, 0, 100, 0, 0, 0, 30341, 0, 0, 0, 'Rageclaw Hunter'),
(29439, 0, 6, 'Why you smell so bad now? You smelled much less bad before!', 12, 0, 100, 0, 0, 0, 30342, 0, 0, 0, 'Rageclaw Hunter'),
(29439, 0, 7, 'Trolls is shameful. Trolls is killers!', 12, 0, 100, 0, 0, 0, 30343, 0, 0, 0, 'Rageclaw Hunter'),
(29490, 0, 0, 'I don\'t know where the grand admiral is. Go to hell!', 12, 0, 100, 0, 0, 0, 30146, 0, 0, 0, 'Captain Hartford'),
(29643, 0, 0, 'This doesn\'t look pretty, lad.', 12, 0, 100, 1, 0, 0, 30286, 0, 0, 0, 'Bailey'),
(29643, 1, 0, 'That right? Well why don\'t you go prance your merry little self over and grab them, eh?', 12, 0, 100, 6, 0, 0, 30289, 0, 0, 0, 'Bailey'),
(29643, 2, 0, 'That\'s strange... for a moment there, I could have swore you called me short.', 12, 0, 100, 1, 0, 0, 30288, 0, 0, 0, 'Bailey'),
(29643, 3, 0, 'Toss me?! Okay, that\'s it punk.', 12, 0, 100, 5, 0, 0, 30290, 0, 0, 0, 'Bailey'),
(29644, 0, 0, 'I don\'t know, Bailey... it\'s not so bad. We could throw a rock at the tools from here.', 12, 0, 100, 1, 0, 0, 30287, 0, 0, 0, 'Bellinger'),
(29644, 1, 0, 'Well... I was just thinking... you\'re a bit smaller, so you\'re less likely to set off any of those mines.', 12, 0, 100, 1, 0, 0, 30297, 0, 0, 0, 'Bellinger'),
(29644, 2, 0, 'No, no, no! Not short... it\'s just... well... maybe I could toss you across most of it?', 12, 0, 100, 1, 0, 0, 30298, 0, 0, 0, 'Bellinger'),
(29644, 3, 0, 'Ahhh!', 12, 0, 100, 0, 0, 0, 30306, 0, 0, 0, 'Bellinger'),
(30243, 0, 0, 'I\'ll eat your heart!', 12, 0, 100, 0, 0, 14388, 30508, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 1, 'I will feed you to the dogs!', 12, 0, 100, 0, 0, 14389, 30499, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 2, 'I will feed you to the dogs!', 12, 0, 100, 0, 0, 14385, 30499, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 3, 'I will take pleasure in gutting you!', 12, 0, 100, 0, 0, 14384, 30498, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 4, 'Sniveling pig!', 12, 0, 100, 0, 0, 14394, 30504, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 5, 'Ugglin oo bjorr!', 12, 0, 100, 0, 0, 14395, 30505, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 6, 'You come to die!', 12, 0, 100, 0, 0, 14392, 30502, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 7, 'Die, maggot!', 12, 0, 100, 0, 0, 14391, 30501, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 8, 'Haraak foln!', 12, 0, 100, 0, 0, 0, 30506, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 9, 'Your entrails will make a fine necklace.', 12, 0, 100, 0, 0, 14386, 30500, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 10, 'Die, maggot!', 12, 0, 100, 0, 0, 14387, 30501, 0, 0, 0, 'Njorndar Spear-Sister'),
(30243, 0, 11, 'Your entrails will make a fine necklace.', 12, 0, 100, 0, 0, 14390, 30500, 0, 0, 0, 'Njorndar Spear-Sister'),
(30453, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 38630, 0, 0, 0, 'Onyx Sanctum Guardian'),
(30632, 0, 0, 'Your entrails will make a fine necklace.', 12, 0, 100, 0, 0, 13535, 30500, 0, 0, 0, 'Mjordin Water Magus'),
(30632, 0, 1, 'I\'ll eat your heart!', 12, 0, 100, 0, 0, 13695, 30508, 0, 0, 0, 'Mjordin Water Magus'),
(30632, 0, 2, 'Haraak foln!', 12, 0, 100, 0, 0, 13541, 30506, 0, 0, 0, 'Mjordin Water Magus'),
(30632, 0, 3, 'I\'ll eat your heart!', 12, 0, 100, 0, 0, 13542, 30508, 0, 0, 0, 'Mjordin Water Magus'),
(30632, 0, 4, 'Sniveling pig!', 12, 0, 100, 0, 0, 13539, 30504, 0, 0, 0, 'Mjordin Water Magus'),
(30632, 0, 5, 'I spit on you!', 12, 0, 100, 0, 0, 13538, 30503, 0, 0, 0, 'Mjordin Water Magus'),
(31279, 1, 0, 'The Light\'s blessing be upon you for aiding me in my time of need, $n.', 12, 0, 100, 0, 0, 0, 31941, 0, 0, 0, 'Father Kamaros'),
(31279, 2, 0, 'I\'ve had my fill of this place. Let us depart.', 12, 0, 100, 0, 0, 0, 31942, 0, 0, 0, 'Father Kamaros'),
(32859, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(32860, 0, 0, 'Relax, mon, I be makin\' dis quick.', 12, 0, 100, 0, 0, 0, 50171, 0, 0, 0, 'on Aggro Text'),
(32863, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(32868, 0, 0, 'Don\'t move, little adventurer. I have the death you seek.', 12, 0, 100, 0, 0, 0, 34476, 0, 0, 0, 'on Aggro Text'),
(32888, 1, 0, 'Intruders! Good, I was getting bored...', 12, 0, 50, 0, 0, 0, 840, 0, 0, 0, 'combat Text'),
(32888, 1, 1, 'Masters, I pledge this Pin to you!', 14, 0, 50, 0, 0, 0, 835, 0, 0, 0, 'combat Text'),
(32989, 0, 0, 'Ya be messin\' with Tzu-Tzu? It no matter...Aetherion\'s here,mon.We gonna roll on ya refugee camp an\' then bring the hurt to ya Lor\'demal.But first ya die!', 12, 0, 100, 0, 0, 0, 33219, 0, 0, 0, 'on Aggro Text'),
(33079, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(33356, 0, 0, 'I want that one killed! The one right there that doesn\'t look like the others!', 14, 0, 50, 0, 0, 0, 33481, 0, 0, 0, 'say Text'),
(33356, 0, 1, 'Smash them! Destroy them! Lok\'tar ogar!', 14, 0, 50, 0, 0, 0, 33479, 0, 0, 0, 'say Text'),
(33356, 0, 2, 'There is no blood easier spilt than that of a puny night elf!', 14, 0, 50, 0, 0, 0, 33483, 0, 0, 0, 'say Text'),
(33356, 1, 0, 'Pathetic weakling. You will die quickly!', 12, 0, 100, 0, 0, 0, 33475, 0, 0, 0, 'say Text'),
(34033, 0, 0, 'Your flesh is forfeit!', 12, 0, 100, 15, 0, 0, 34163, 0, 0, 0, 'Teegan Holloway Aggro'),
(34033, 1, 0, 'I said, SEARCH the bodies BEFORE you eat them!', 12, 0, 100, 5, 0, 0, 34167, 0, 0, 0, 'Teegan Holloway Script'),
(34033, 1, 1, 'Leave no stone unturned. I mean that literally, you heaps of decay! Tear this place apart if you have to.', 12, 0, 100, 5, 0, 0, 34168, 0, 0, 0, 'Teegan Holloway Script'),
(34046, 0, 0, '%s cackles in glee.', 16, 0, 100, 0, 0, 0, 40210, 0, 0, 0, 'combat Text'),
(34413, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(34499, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(34545, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(34560, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(34592, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(34733, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(34851, 0, 0, 'What... what are those things on the rooftops?', 12, 0, 100, 0, 0, 0, 39313, 0, 0, 0, 'Panicked Citizen to Player'),
(34931, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(34934, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(34937, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(34939, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(34941, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(34947, 0, 0, 'I shall draw your soul into the mist!', 12, 0, 100, 0, 0, 0, 24846, 0, 0, 0, 'Kvaldir Berserker'),
(34947, 0, 1, 'YAAARRRGH!', 12, 0, 100, 0, 0, 0, 24847, 0, 0, 0, 'Kvaldir Berserker'),
(34947, 0, 2, 'Be consumed by the mist!', 12, 0, 100, 0, 0, 0, 24848, 0, 0, 0, 'Kvaldir Berserker'),
(34947, 0, 3, 'Look what\'s lost its way...', 12, 0, 100, 0, 0, 0, 24849, 0, 0, 0, 'Kvaldir Berserker'),
(34947, 0, 4, 'I will heave your carcass into the ocean myself!', 12, 0, 100, 0, 0, 0, 24850, 0, 0, 0, 'Kvaldir Berserker'),
(34947, 0, 5, 'You\'re not even fit to be fed to Leviroth.', 12, 0, 100, 0, 0, 0, 24851, 0, 0, 0, 'Kvaldir Berserker'),
(34947, 0, 6, 'You\'ve strayed too far from your comfortable soil, $N.', 12, 0, 100, 0, 0, 0, 24852, 0, 0, 0, 'Kvaldir Berserker'),
(35190, 0, 0, 'Defend the gates!', 12, 0, 50, 0, 0, 0, 35437, 0, 0, 0, 'on Aggro Text'),
(35190, 0, 1, 'For the Horde!', 12, 0, 50, 0, 0, 0, 4921, 0, 0, 0, 'on Aggro Text'),
(35190, 0, 2, 'For the Warchief!', 12, 0, 50, 0, 0, 0, 2104, 0, 0, 0, 'on Aggro Text'),
(35190, 1, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(35503, 0, 0, 'These grounds ... are not ... yours ...', 12, 0, 100, 0, 0, 0, 35859, 0, 0, 0, 'on Aggro Text'),
(36013, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(36147, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(36287, 0, 0, 'You are scary!  I just want my mommy!', 12, 0, 100, 0, 0, 0, 36325, 0, 0, 0, 'Cynthia to Player'),
(36288, 0, 0, 'Are you one of the good worgen, $g mister:ma\'am;?  Did you see Cynthia hiding in the sheds outside?', 12, 0, 100, 0, 0, 0, 36326, 0, 0, 0, 'Ashley to Player'),
(36289, 0, 0, 'Don\'t hurt me!  I was just looking for my sisters!  I think Ashley\'s inside that house!', 12, 0, 100, 0, 0, 0, 36324, 0, 0, 0, 'James to Player'),
(36384, 0, 0, 'Got one!', 12, 0, 50, 0, 0, 0, 60200, 0, 0, 0, 'combat Text'),
(36384, 0, 1, 'Snagged one!', 12, 0, 50, 0, 0, 0, 36367, 0, 0, 0, 'combat Text'),
(36384, 0, 2, 'Zap\'em!', 12, 0, 50, 0, 0, 0, 36368, 0, 0, 0, 'combat Text'),
(36385, 0, 0, 'Got one!', 12, 0, 50, 0, 0, 0, 60200, 0, 0, 0, 'combat Text'),
(36385, 0, 1, 'Snagged one!', 12, 0, 50, 0, 0, 0, 36367, 0, 0, 0, 'combat Text'),
(36385, 0, 2, 'Zap\'em!', 12, 0, 50, 0, 0, 0, 36368, 0, 0, 0, 'combat Text'),
(36407, 0, 0, 'My house!', 12, 0, 100, 0, 0, 0, 36373, 0, 0, 0, 'on Aggro Text'),
(36712, 0, 0, 'Squealer take this land! Tauren will burn!', 12, 0, 100, 0, 0, 0, 38323, 0, 0, 0, 'on Aggro Text'),
(36815, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(36884, 0, 0, 'Haaadoouuuu....', 12, 0, 100, 0, 0, 0, 43407, 0, 0, 0, 'on Aggro Text'),
(36884, 1, 0, '... KEN!!', 14, 0, 100, 0, 0, 0, 43408, 0, 0, 0, 'on Aggro Text'),
(36936, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(37112, 0, 0, 'I am from the elemental plane!', 14, 12, 100, 0, 0, 0, 36949, 0, 0, 0, 'Wayward Fire Elemental'),
(37112, 1, 0, 'I AM FROM THE ELEMENTAL PLANE!', 12, 12, 100, 0, 0, 0, 37019, 0, 0, 0, 'Wayward Fire Elemental'),
(37157, 0, 0, 'Guards!I expect this $r to be clapped into chains!', 12, 0, 100, 0, 0, 0, 36947, 0, 0, 0, 'on Aggro Text'),
(37171, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(37513, 0, 0, 'You, <Snort> you are strong <Gurgle>. But... Strong enough for THE BOARPOCALYPSE?', 14, 0, 100, 0, 0, 0, 37129, 0, 0, 0, 'on Aggro Text'),
(37513, 1, 0, 'You ... survive the boars? <Snort> So many boars! So sad! <Gurgle>', 12, 0, 100, 0, 0, 0, 37130, 0, 0, 0, 'on Death Text'),
(37513, 2, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(38659, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(38880, 0, 0, 'I\'ll crush you!', 12, 0, 50, 0, 0, 0, 1925, 0, 0, 0, 'on Aggro Text'),
(38880, 0, 1, 'Me smash! You die!', 12, 0, 50, 0, 0, 0, 1926, 0, 0, 0, 'on Aggro Text'),
(38880, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 50, 0, 0, 0, 1927, 0, 0, 0, 'on Aggro Text'),
(38880, 1, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(39020, 0, 0, 'Monsters! Monsters come to take our gold!', 14, 0, 50, 0, 0, 0, 40525, 0, 0, 0, 'on Aggro Text'),
(39020, 0, 1, 'Kill the pig! Spill it\'s blood!', 14, 0, 50, 0, 0, 0, 40528, 0, 0, 0, 'on Aggro Text'),
(39061, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(39174, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(39186, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(39279, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(40665, 0, 0, 'Ye\'ll not get around our blockade with scavengin\'!', 12, 0, 100, 0, 0, 0, 40574, 0, 0, 0, 'on Aggro Text'),
(40906, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Furious Rage'),
(40959, 0, 0, 'Raaar!!! Me smash $r!', 12, 0, 50, 0, 0, 0, 1927, 0, 0, 0, 'on Aggro Text'),
(40959, 0, 1, 'Me smash! You die!', 12, 0, 50, 0, 0, 0, 1926, 0, 0, 0, 'on Aggro Text'),
(40959, 0, 2, 'I\'ll crush you!', 12, 0, 50, 0, 0, 0, 1925, 0, 0, 0, 'on Aggro Text'),
(42391, 2, 0, 'Who killed the Furlbrows? I\'ll tell you who killed the Furlbrows: KING VARIAN WRYNN, THAT\'S WHO! And he\'s killin\' the rest of us too. One bum at a time. The only thing I can tell you is that I saw some gnolls leavin\' the place a few hours before the law arrived.', 12, 0, 100, 5, 0, 0, 42382, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 3, 0, 'Between you, me, and the tree, murlocs killed the Furlbrows. Yep, saw \'em with my own two eyes. Think they\'d been casin\' the joint for days, maybe months. They left in a hurry once they got wind of "Johnny Law" and the idiot brigade over there...', 12, 0, 100, 273, 0, 0, 42383, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 0, 'Judgment day comes! The brotherhood will be reborn!', 12, 7, 100, 0, 0, 0, 42379, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 1, 'Now you\'ve gone and done it! TIME FOR THE FIST!', 12, 7, 100, 0, 0, 0, 42389, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 2, 'You\'ll get nothing out of me!', 12, 7, 100, 0, 0, 0, 42378, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 3, 'Livin\' like an animal is hard enough without your insults!', 12, 7, 100, 0, 0, 0, 42386, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 4, 'I ain\'t tellin\' you a damn thing!', 12, 7, 100, 0, 0, 0, 42385, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 5, 'Maybe I can sell your liver for some gold.', 12, 7, 100, 0, 0, 0, 42387, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 6, 'You want my foot in your front or in your rear? Make the call.', 12, 7, 100, 0, 0, 0, 42390, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 7, 'They died of natural causes...', 12, 7, 100, 0, 0, 0, 42377, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 8, 'You rich punks are all the same!', 12, 7, 100, 0, 0, 0, 42384, 0, 0, 0, 'West Plains Drifter to Player'),
(42391, 4, 9, 'You can\'t buy me! DIE!', 12, 7, 100, 0, 0, 0, 42374, 0, 0, 0, 'West Plains Drifter to Player'),
(43657, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(44722, 0, 0, 'Could you forse this, fool?', 12, 0, 100, 0, 0, 0, 44745, 0, 0, 0, 'on Aggro Text'),
(44882, 0, 0, 'We haven\'t got much time. Crowly will be arriving shortly.', 12, 0, 100, 5, 0, 0, 44951, 0, 0, 0, ''),
(44882, 1, 0, 'THERE! Hide in the armoire! I\'ll hide in the shadow next to you.', 12, 0, 100, 25, 0, 0, 44955, 0, 0, 0, ''),
(44882, 2, 0, 'I live... and die... for the Banshee Queen.', 12, 0, 100, 0, 0, 0, 44971, 0, 0, 0, ''),
(44883, 0, 0, 'Have you given any more thought to my proposal, Ivar?', 12, 0, 100, 6, 0, 0, 44957, 0, 0, 0, ''),
(44883, 1, 0, 'If we\'re to win this war we will need your help. Our packs must unite! The Forsaken will destroy us otherwise.', 12, 0, 100, 396, 0, 0, 44960, 0, 0, 0, ''),
(44883, 2, 0, 'You are the alpha male, Ivar. The rest of the ferals in Silverpine will do as you command.', 12, 0, 100, 397, 0, 0, 44961, 0, 0, 0, ''),
(44883, 3, 0, 'So will you help?', 12, 0, 100, 6, 0, 0, 44965, 0, 0, 0, ''),
(44884, 0, 0, 'Why trust you now, Crowley? You abandoned us. Left us to die.', 12, 0, 100, 6, 0, 0, 44959, 0, 0, 0, ''),
(44884, 1, 0, 'I don\'t care about your war, Crowley.', 12, 0, 100, 274, 0, 0, 44962, 0, 0, 0, ''),
(44884, 2, 0, 'But...', 12, 0, 100, 1, 0, 0, 44963, 0, 0, 0, ''),
(44884, 3, 0, 'I have seen firsthand what the Forsaken are capable of doing. It is true. They hunt us... slaughter the defenseless.', 12, 0, 100, 1, 0, 0, 44964, 0, 0, 0, ''),
(44884, 4, 0, 'Aye, I will gather my pack... we...', 12, 0, 100, 1, 0, 0, 44966, 0, 0, 0, ''),
(44884, 5, 0, 'Packleader Ivar Bloodfang sniffs the air.', 16, 0, 100, 479, 0, 0, 44967, 0, 0, 0, ''),
(44884, 6, 0, 'It would appear that we are being watched, Crowley. You have grown soft... Likely Greymane\'s fault.', 12, 0, 100, 1, 0, 0, 44968, 0, 0, 0, ''),
(44884, 7, 0, 'Treacherous little pup!', 12, 0, 100, 15, 0, 0, 44969, 0, 0, 0, ''),
(44884, 8, 0, 'What say you now, spy?', 12, 0, 100, 0, 0, 0, 44970, 0, 0, 0, ''),
(44884, 9, 0, 'I was hoping you\'d say that...', 12, 0, 100, 0, 0, 0, 44972, 0, 0, 0, ''),
(44884, 10, 0, 'I will prepare the pack. It will take some time to gather them all, but we will join... for now.', 12, 0, 100, 1, 0, 0, 44973, 0, 0, 0, ''),
(45387, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(45410, 0, 0, 'Chosen of the Elder Crone! You don\'t realize yet, do you? I\'ll put an end to you first! You and your friend!', 14, 0, 100, 0, 0, 0, 45557, 0, 0, 0, 'on Aggro Text'),
(45410, 1, 0, 'Spirits of the Firelands, fill me with your rage!', 14, 0, 100, 0, 0, 0, 46085, 0, 0, 0, 'in Battle Text'),
(45410, 2, 0, 'Spirits of Skywall, heed my call!', 14, 0, 100, 0, 0, 0, 46087, 0, 0, 0, 'in Battle Text'),
(45410, 3, 0, 'Why would she choose... an outsider?', 12, 0, 100, 0, 0, 0, 45558, 0, 0, 0, 'on Death Text'),
(45438, 0, 0, 'You\'re the one my aunt sent? A test, no doubt. I\'ll kill you quickly and prove myself to her once again.', 14, 0, 100, 0, 0, 0, 45569, 0, 0, 0, 'on Aggro Text'),
(45438, 1, 0, 'Stompers, defend your Chieftan!', 14, 0, 100, 0, 0, 0, 46121, 0, 0, 0, 'on Summon Text'),
(45438, 2, 0, 'Reavers, at my side!', 14, 0, 100, 0, 0, 0, 46122, 0, 0, 0, 'at HP Text'),
(45438, 3, 0, 'Geomancers, bury them in stone and flame!', 14, 0, 100, 0, 0, 0, 46123, 0, 0, 0, 'at HP Text'),
(45438, 4, 0, 'NO! Magatha, forgive me! Bring me back!', 14, 0, 100, 0, 0, 0, 45570, 0, 0, 0, 'on Death Text'),
(46254, 0, 0, 'Forest just setback!', 14, 0, 100, 0, 0, 0, 46474, 0, 0, 0, 'Hogger - Stockades - SAY_PULL'),
(46254, 2, 0, 'Yiiipe!', 14, 0, 100, 0, 0, 0, 46476, 0, 0, 0, 'Hogger - Stockades - SAY_DEATH'),
(46264, 0, 0, 'ALL MUST BURN!', 14, 0, 100, 0, 0, 0, 46487, 0, 0, 0, 'TheStockade: Lord Overheat - SAY_PULL'),
(46264, 1, 0, 'FIRE... EXTINGUISHED!', 14, 0, 100, 0, 0, 0, 46489, 0, 0, 0, 'TheStockade: Lord Overheat - SAY_DEATH'),
(46383, 0, 0, 'Allow me to introduce myself. I am Randolph Moloch, and I will be killing you all today.', 14, 0, 100, 0, 0, 0, 46495, 0, 0, 0, 'Randolph Moloch - Stockades - SAY_PULL'),
(46383, 2, 0, 'My epic schemes, my great plans! Gone!', 14, 0, 100, 0, 0, 0, 46497, 0, 0, 0, 'Randolph Moloch - Stockades - SAY_DEATH'),
(47387, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 2384, 0, 0, 0, 'combat Frenzy'),
(47585, 0, 0, 'Hey, you haven\'t seen grom-grom have you? Orc, about this tall. No?', 12, 0, 50, 1, 0, 0, 48001, 0, 0, 0, 'say Text'),
(47585, 0, 1, 'Hey, you haven\'t seen Grom-Grom have you? Orc, about this tall. No?', 12, 0, 50, 1, 0, 0, 48001, 0, 0, 0, 'say Text'),
(47585, 0, 2, 'Isn\'t it weird that we are keeping Magatha Grimtotem captive here? Good thing all of her totems were destroyed.', 12, 0, 50, 1, 0, 0, 48004, 0, 0, 0, 'say Text'),
(47585, 0, 3, 'Isn\'t it weird that we are keeping Magatha Grimtotem captive here? Good thing all of her totems were destroyed.', 12, 0, 50, 1, 0, 0, 48004, 0, 0, 0, 'say Text'),
(47585, 0, 4, 'Do i know you? No? Welcome to the Twilight\'s Hammer.', 12, 0, 50, 1, 0, 0, 47997, 0, 0, 0, 'say Text'),
(47585, 0, 5, 'Something big\'s brewing at the Withering to the east.', 12, 0, 50, 1, 0, 0, 48002, 0, 0, 0, 'say Text'),
(47585, 0, 6, 'Whatever it is, i hope that it\'ll be over soon and we get restationed somewhere nicer.', 12, 0, 50, 1, 0, 0, 48002, 0, 0, 0, 'say Text'),
(47585, 0, 7, 'The end days are nigh!', 12, 0, 50, 1, 0, 0, 47998, 0, 0, 0, 'say Text'),
(47585, 0, 8, 'Keep your eyes peeled, They say that freak that was attacking people earlier might still be around.', 12, 0, 50, 1, 0, 0, 48003, 0, 0, 0, 'say Text'),
(47585, 0, 9, 'New recruit? Have you reported to the commander yet?', 12, 0, 50, 1, 0, 0, 48000, 0, 0, 0, 'say Text'),
(47630, 0, 0, 'Hey, you haven\'t seen grom-grom have you? Orc, about this tall. No?', 12, 0, 50, 1, 0, 0, 48001, 0, 0, 0, 'say Text'),
(47630, 0, 1, 'Hey, you haven\'t seen Grom-Grom have you? Orc, about this tall. No?', 12, 0, 50, 1, 0, 0, 48001, 0, 0, 0, 'say Text'),
(47630, 0, 2, 'Isn\'t it weird that we are keeping Magatha Grimtotem captive here? Good thing all of her totems were destroyed.', 12, 0, 50, 1, 0, 0, 48004, 0, 0, 0, 'say Text'),
(47630, 0, 3, 'Isn\'t it weird that we are keeping Magatha Grimtotem captive here? Good thing all of her totems were destroyed.', 12, 0, 50, 1, 0, 0, 48004, 0, 0, 0, 'say Text'),
(47630, 0, 4, 'Do i know you? No? Welcome to the Twilight\'s Hammer.', 12, 0, 50, 1, 0, 0, 47997, 0, 0, 0, 'say Text'),
(47630, 0, 5, 'Something big\'s brewing at the Withering to the east.', 12, 0, 50, 1, 0, 0, 48002, 0, 0, 0, 'say Text'),
(47630, 0, 6, 'Whatever it is, i hope that it\'ll be over soon and we get restationed somewhere nicer.', 12, 0, 50, 1, 0, 0, 48002, 0, 0, 0, 'say Text'),
(47630, 0, 7, 'The end days are nigh!', 12, 0, 50, 1, 0, 0, 47998, 0, 0, 0, 'say Text'),
(47630, 0, 8, 'Keep your eyes peeled, They say that freak that was attacking people earlier might still be around.', 12, 0, 50, 1, 0, 0, 48003, 0, 0, 0, 'say Text'),
(47630, 0, 9, 'New recruit? Have you reported to the commander yet?', 12, 0, 50, 1, 0, 0, 48000, 0, 0, 0, 'say Text'),
(47679, 0, 0, 'Kitty... KITTY! I\'M SO SORRY, KITTY! COME BACK! DON\'T LEAVE ME LIKE THIS!', 14, 0, 100, 0, 0, 0, 48258, 0, 0, 0, 'on Aggro Text'),
(47804, 0, 0, 'Hey, you haven\'t seen grom-grom have you? Orc, about this tall. No?', 12, 0, 50, 1, 0, 0, 48001, 0, 0, 0, 'say Text'),
(47804, 0, 1, 'Hey, you haven\'t seen Grom-Grom have you? Orc, about this tall. No?', 12, 0, 50, 1, 0, 0, 48001, 0, 0, 0, 'say Text'),
(47804, 0, 2, 'Isn\'t it weird that we are keeping Magatha Grimtotem captive here? Good thing all of her totems were destroyed.', 12, 0, 50, 1, 0, 0, 48004, 0, 0, 0, 'say Text'),
(47804, 0, 3, 'Isn\'t it weird that we are keeping Magatha Grimtotem captive here? Good thing all of her totems were destroyed.', 12, 0, 50, 1, 0, 0, 48004, 0, 0, 0, 'say Text'),
(47804, 0, 4, 'Do i know you? No? Welcome to the Twilight\'s Hammer.', 12, 0, 50, 1, 0, 0, 47997, 0, 0, 0, 'say Text'),
(47804, 0, 5, 'Something big\'s brewing at the Withering to the east.', 12, 0, 50, 1, 0, 0, 48002, 0, 0, 0, 'say Text'),
(47804, 0, 6, 'Whatever it is, i hope that it\'ll be over soon and we get restationed somewhere nicer.', 12, 0, 50, 1, 0, 0, 48002, 0, 0, 0, 'say Text'),
(47804, 0, 7, 'The end days are nigh!', 12, 0, 50, 1, 0, 0, 47998, 0, 0, 0, 'say Text'),
(47804, 0, 8, 'Keep your eyes peeled, They say that freak that was attacking people earlier might still be around.', 12, 0, 50, 1, 0, 0, 48003, 0, 0, 0, 'say Text'),
(47804, 0, 9, 'New recruit? Have you reported to the commander yet?', 12, 0, 50, 1, 0, 0, 48000, 0, 0, 0, 'say Text'),
(48727, 0, 0, 'Leave now... you do not deserve to suffer the crystal\'s wrath...', 12, 0, 100, 0, 0, 0, 48898, 0, 0, 0, 'Released Highborne Spirit'),
(48727, 0, 1, 'Relief at last...', 12, 0, 100, 0, 0, 0, 48896, 0, 0, 0, 'Released Highborne Spirit'),
(48727, 0, 2, 'Thank you...', 12, 0, 100, 0, 0, 0, 48897, 0, 0, 0, 'Released Highborne Spirit'),
(48727, 0, 3, 'The crystal has returned. You must leave...', 12, 0, 100, 0, 0, 0, 48900, 0, 0, 0, 'Released Highborne Spirit'),
(48740, 0, 0, 'You don\'t understand! I had to study it! I HAD TO!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'on Aggro Text'),
(48740, 1, 0, 'Forgive... me...', 12, 0, 100, 0, 0, 0, 48947, 0, 0, 0, 'on Death Text'),
(50053, 0, 0, '%s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Enrage'),
(51712, 0, 0, '%s becomes rage!', 16, 0, 100, 0, 0, 0, 10677, 0, 0, 0, 'combat Rage'),
(1008, 0, 0, 'More bones to gnaw on...', 12, 0, 100, 0, 0, 0, 1871, 0, 0, 0, 'Mosshide Mongrel - Random Say on Aggro'),
(1008, 0, 1, 'Grrrr... fresh meat!', 12, 0, 100, 0, 0, 0, 1870, 0, 0, 0, 'Mosshide Mongrel - Random Say on Aggro'),
(1052, 1, 0, '%s\'s eyes glow red as he lights his dynamite and begins to cackle madly!', 16, 7, 100, 0, 0, 0, 637, 0, 0, 0, 'Dark Iron Saboteur'),
(1164, 0, 0, 'Crush!', 12, 0, 100, 0, 0, 0, 1913, 0, 0, 0, 'Stonesplinter Bonesnapper'),
(1164, 0, 1, 'Kill!', 12, 0, 100, 0, 0, 0, 1914, 0, 0, 0, 'Stonesplinter Bonesnapper'),
(1164, 0, 2, 'Destroy!', 12, 0, 100, 0, 0, 0, 1915, 0, 0, 0, 'Stonesplinter Bonesnapper'),
(2391, 0, 0, 'Whoops!', 12, 0, 100, 113, 0, 0, 3326, 0, 0, 0, 'Serge Hinott'),
(3693, 4, 0, 'Grimclaw?! Easy there, my friend... where is your master Volcor?', 12, 0, 0, 0, 0, 0, 1227, 0, 0, 0, 'Terenthis'),
(3693, 5, 0, 'There... that should help. Now, tell me what\'s happened, Grimclaw.', 12, 0, 0, 0, 0, 0, 1230, 0, 0, 0, 'Terenthis'),
(4980, 8, 0, 'Must be your lucky day. Alright, I\'ll talk. Just leave me alone. Look, you\'re not going to believe me, but it wa... oh, Light, looks like the girl could shoot...', 12, 0, 0, 0, 0, 0, 1725, 0, 0, 0, 'Paval'),
(29319, 0, 0, 'It\'s an angry male!', 42, 0, 100, 0, 0, 473, 33191, 0, 0, 0, 'Icepaw Bear'),
(40352, 0, 0, 'Darkspears, we consult de spirits! Drummers, take your places!', 12, 0, 100, 25, 0, 0, 40387, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 1, 0, 'Spirits, we be gathered here to ask for your guidance.', 12, 0, 100, 5, 0, 0, 40388, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 2, 0, 'Our leader, Vol\'jin, son of Sen\'jin, issued de call to all Darkspears: reclaim de Echo Isles for our tribe.', 12, 0, 100, 1, 0, 0, 40389, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 3, 0, 'Spirits! I offer me own body to you! Speak through me! Is de time right for mighty Vol\'jin\'s undertaking?', 12, 0, 100, 5, 0, 0, 40390, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 4, 0, 'De ancestors hear ya, witch doctor!', 12, 0, 100, 1, 0, 0, 40391, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 5, 0, 'Know dat your plans please us, Darkspears. De son of Sen\'jin walks de right path.', 12, 0, 100, 1, 0, 0, 40392, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 6, 0, 'De task in front of ya will not be easy, but ya have our blessin\'.', 12, 0, 100, 1, 0, 0, 40393, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 7, 0, 'Ya gave up your home an\' ya gave up de loas of your ancestors when ya left de Echo Isles. Dey will not be pleased dat you been ignorin\' dem.', 12, 0, 100, 1, 0, 0, 40394, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 8, 0, 'Ya must make amends wit\' Bwonsamdi, de guardian of de dead, if ya hope to defeat Zalazane. It be de only way. Tell de son of Sen\'jin dese things.', 12, 0, 100, 1, 0, 0, 40395, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40352, 9, 0, 'De spirits have blessed us wit\' an answer! De Echo Isles will be ours again!', 12, 0, 100, 5, 0, 0, 40396, 0, 0, 0, 'Witch Doctor Hez\'tok'),
(40416, 0, 0, 'He got a big army, an\' he be plannin\' somethin\' down dere.', 12, 0, 100, 1, 0, 0, 40412, 0, 0, 0, 'Darkspear Scout'),
(40416, 0, 1, 'Zalazane got most of his hexed trolls hidden under de canopy on de big island.', 12, 0, 100, 1, 0, 0, 40411, 0, 0, 0, 'Darkspear Scout'),
(43191, 0, 0, 'I ... I can\'t give you any of our supplies! Our Warchief... He would...', 12, 0, 100, 274, 0, 0, 43238, 0, 0, 0, 'Gregor to Player'),
(48487, 0, 0, 'What is going on in here?!', 12, 0, 100, 5, 0, 0, 48691, 0, 0, 0, 'Whisperwind Druid to Player'),
(48487, 1, 0, 'The Arch Druid... how in the world...?', 12, 0, 100, 274, 0, 0, 48692, 0, 0, 0, 'Whisperwind Druid to Player'),
(48487, 2, 0, 'I... I must tell the others. You should find Huntress Selura right away.', 12, 0, 100, 1, 0, 0, 48693, 0, 0, 0, 'Whisperwind Druid to Player');
