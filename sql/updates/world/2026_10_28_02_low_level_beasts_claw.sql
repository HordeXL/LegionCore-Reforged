-- Low-level beasts no longer cast Claw (31289): officially only Gaivan Shadewalker and Sand Scorpid use it
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3243, 3415, 3425, 3475, 15366, 15372, 34543, 34829, 35904, 39049) AND `action_type` = 11 AND `action_param1` = 31289;
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` IN (3243, 3475, 15366, 15372, 35904) AND `AIName` = 'SmartAI'
    AND `entry` NOT IN (SELECT `entryorguid` FROM (SELECT `entryorguid` FROM `smart_scripts` WHERE `source_type` = 0) AS `s`);
