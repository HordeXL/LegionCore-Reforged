-- Ashran: the world PvP engine is no longer registered on its zone, each battleground game makes its own (the row keeps the script name).
UPDATE `outdoorpvp_template` SET `comment` = 'Ashran (one engine per battleground game)' WHERE `TypeId` = 6;
