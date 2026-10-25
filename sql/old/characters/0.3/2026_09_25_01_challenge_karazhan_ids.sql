-- Records of Return to Karazhan were saved without their challenge id and merged Upper and Lower after a restart.
-- The chest of each half tells them apart: 269852 Lower (227), 269871 Upper (234).
UPDATE `challenge` SET `ChallengeID` = 227 WHERE `MapID` = 1651 AND `ChestID` = 269852 AND `ChallengeID` = 0;
UPDATE `challenge` SET `ChallengeID` = 234 WHERE `MapID` = 1651 AND `ChestID` = 269871 AND `ChallengeID` = 0;
