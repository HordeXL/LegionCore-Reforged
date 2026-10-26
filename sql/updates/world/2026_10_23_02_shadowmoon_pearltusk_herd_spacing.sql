-- Pearltusk herds: twice the spacing between the grazers so they no longer overlap
UPDATE `creature_formations` SET `dist` = `dist` * 2 WHERE `leaderGUID` IN (309615, 309874, 309876, 309922, 312700, 312754, 312767, 312796, 312799, 313157, 313168, 313169, 313170, 313175, 313396, 313651) AND `memberGUID` <> `leaderGUID`;
UPDATE `creature` m JOIN `creature_formations` f ON f.`memberGUID` = m.`guid` AND f.`memberGUID` <> f.`leaderGUID` JOIN `creature` l ON l.`guid` = f.`leaderGUID`
SET m.`position_x` = l.`position_x` + 2 * (m.`position_x` - l.`position_x`), m.`position_y` = l.`position_y` + 2 * (m.`position_y` - l.`position_y`)
WHERE f.`leaderGUID` IN (309615, 309874, 309876, 309922, 312700, 312754, 312767, 312796, 312799, 313157, 313168, 313169, 313170, 313175, 313396, 313651);
