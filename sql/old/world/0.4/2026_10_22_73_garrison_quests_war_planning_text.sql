-- Garrison War Planning Map: gossip text used when no assault is left to offer
DELETE FROM `npc_text` WHERE `ID` = 926001;
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`, `VerifiedBuild`) VALUES (926001, 1, 5421861, 26365);
