-- The Wound stops depending on which zone you stand in.
--
-- phase_definitions is indexed by zone, and PhaseMgr::Recalculate only ever looks up the zone the
-- player is currently in. Step out of Silithus and the definitions are dropped, the terrain swap
-- with them; step back in and the swap returns, but the client only reads VisibleMapID when it
-- loads a map, so the ground stays the old one until something forces a reload. That is the whole
-- of the reported problem, and it is a property of the table, not of the script.
--
-- What was asked is that only Zidormi decides. So the definition is given to every zone of
-- Kalimdor: the swap is then never dropped while the player stays on map 1, crossing a zone border
-- changes nothing, and no reload is ever needed. Leaving Kalimdor for another map forces a real
-- loading screen anyway, which is precisely when the client can take a swap.
--
-- This is safe, and measurably so rather than by assertion: map 1817 has exactly 25 tiles,
-- columns 43 to 47 and rows 28 to 32 - a five by five block over Silithus and nothing else. A
-- terrain swap only replaces tiles the swapped map actually has, so in Un'Goro, Tanaris or Durotar
-- it replaces nothing at all. The zone list is read from the spawns of map 1; a couple of the ids
-- in it may be stale data pointing at zones that live elsewhere, which costs nothing for the same
-- reason.
--
-- Only the Wound half is duplicated. Entry 11, the old zone, exists to hide the Wound's creatures
-- and show the vanilla ones, and that only matters inside Silithus - where entry 10 and entry 11
-- already do the work. Outside, all that must survive is the swap.
--
-- The condition is the same one entry 10 carries: the marker absent, on effect 1. Carrying 255152
-- means standing before the Wound, so the swap goes away with it, everywhere, at once.

DELETE FROM `phase_definitions` WHERE `entry` = 4600;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES
(    4, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(    8, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   14, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   15, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   16, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   17, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   33, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   40, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   44, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(   85, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  141, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  148, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  215, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  331, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  357, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  361, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  400, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  405, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  406, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  440, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  490, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  493, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  616, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  618, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  719, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
(  876, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 1497, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 1637, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 1638, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 1657, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 2159, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3483, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3518, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3519, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3520, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3521, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3522, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3523, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 3717, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 4709, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5034, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5042, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5144, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5145, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5146, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5287, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5339, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5695, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5736, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 5788, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 6450, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 6451, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 6452, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 6453, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 7541, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor'),
( 7705, 4600, 0, '10277', 1817, 1817, 0, 16, 'Silithus - the Wound stays loaded across Kalimdor');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceEntry` = 4600;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23,     4, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,     8, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    14, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    15, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    16, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    17, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    33, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    40, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    44, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,    85, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   141, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   148, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   215, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   331, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   357, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   361, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   400, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   405, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   406, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   440, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   490, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   493, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   616, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   618, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   719, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,   876, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  1497, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  1637, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  1638, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  1657, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  2159, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3483, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3518, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3519, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3520, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3521, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3522, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3523, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  3717, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  4709, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5034, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5042, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5144, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5145, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5146, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5287, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5339, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5695, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5736, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  5788, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  6450, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  6451, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  6452, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  6453, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  7541, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23,  7705, 4600, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker');
