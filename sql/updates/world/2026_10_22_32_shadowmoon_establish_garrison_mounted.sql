-- Shadowmoon Valley, Establish Your Garrison: Baros creates the garrison even when the player talks to him mounted
UPDATE `smart_scripts` SET `action_param2` = 2 WHERE `entryorguid` = 79243 AND `source_type` = 0 AND `id` IN (0, 1) AND `action_type` = 85;
