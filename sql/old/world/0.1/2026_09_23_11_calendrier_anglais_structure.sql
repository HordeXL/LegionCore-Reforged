-- The announcement table: English columns, durations in days, no dates set.
--
-- It is recreated in one go rather than amended column by column: a run of `ALTER` statements
-- leaves the columns in whatever order the additions put them, and forces an editor refresh every
-- time. Nothing is lost, no announcement was in service yet.
--
-- `Name` and `Description` hold English, which the core writes into the client's base table: that
-- is the universal fallback. `NameLocalized` and `DescriptionLocalized` hold the server's own
-- locale, the one `DBC.Locale` names, and go into the locale table.
--
-- `StartDate` stays empty until an opening is decided. `DurationDays` reads in days: 7 for a week,
-- 14 for two. `RepeatDays` brings the announcement back - 30 for once a month, 0 for a single
-- occurrence.
DROP TABLE IF EXISTS `custom_calendar_event`;
CREATE TABLE `custom_calendar_event` (
  `HolidayID`            INT UNSIGNED      NOT NULL COMMENT 'Holidays.db2 record id, do not change',
  `HolidayNameID`        INT UNSIGNED      NOT NULL COMMENT 'HolidayNames.db2 record id, do not change',
  `HolidayDescriptionID` INT UNSIGNED      NOT NULL COMMENT 'HolidayDescriptions.db2 record id, do not change',
  `Name`                 VARCHAR(255)      NOT NULL DEFAULT '' COMMENT 'English wording, what an untranslated client shows',
  `NameLocalized`        VARCHAR(255)      NOT NULL DEFAULT '' COMMENT 'wording in the server locale (DBC.Locale)',
  `Description`          VARCHAR(255)      NOT NULL DEFAULT '' COMMENT 'announcement body, in English',
  `DescriptionLocalized` VARCHAR(255)      NOT NULL DEFAULT '' COMMENT 'announcement body, in the server locale',
  `StartDate`            DATETIME          NULL     COMMENT 'when it starts; empty until an opening is decided',
  `DurationDays`         SMALLINT UNSIGNED NOT NULL DEFAULT 7 COMMENT 'how many days it shows: 7 = one week, 14 = two',
  `RepeatDays`           SMALLINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'how many days between occurrences; 0 = once only',
  `Texture1`             INT UNSIGNED      NOT NULL DEFAULT 0 COMMENT 'start image',
  `Texture2`             INT UNSIGNED      NOT NULL DEFAULT 0 COMMENT 'ongoing image',
  `Texture3`             INT UNSIGNED      NOT NULL DEFAULT 0 COMMENT 'end image',
  `Enabled`              TINYINT UNSIGNED  NOT NULL DEFAULT 0 COMMENT '1 to show, 0 to take down',
  `GameEventID`          INT UNSIGNED      NOT NULL DEFAULT 0 COMMENT 'game_event to fire on the same dates; 0 for none',
  `Notes`                VARCHAR(255)      NOT NULL DEFAULT '' COMMENT 'free note, nothing the core reads',
  PRIMARY KEY (`HolidayID`),
  UNIQUE KEY `name_id` (`HolidayNameID`),
  UNIQUE KEY `description_id` (`HolidayDescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Calendar announcements: fill StartDate, set Enabled to 1';

INSERT INTO `custom_calendar_event`
 (`HolidayID`, `HolidayNameID`, `HolidayDescriptionID`, `Name`, `NameLocalized`,
  `Description`, `DescriptionLocalized`, `StartDate`, `DurationDays`, `RepeatDays`,
  `Texture1`, `Texture2`, `Texture3`, `Enabled`, `GameEventID`, `Notes`) VALUES
 (202, 167, 167, 'The Emerald Nightmare: Darkbough',           'Le Cauchemar d’émeraude : Sombranche',          'The first wing opens in Raid Finder.',     'La première aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1452698, 1452698, 1452698, 0,   0, 'raid 7.0'),
 (203, 168, 168, 'The Emerald Nightmare: Tormented Guardians', 'Le Cauchemar d’émeraude : Gardiens tourmentés', 'The second wing opens in Raid Finder.',    'La deuxième aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1452700, 1452700, 1452700, 0,   0, 'raid 7.0'),
 (204, 169, 169, 'The Emerald Nightmare: Rift of Aln',         'Le Cauchemar d’émeraude : Faille d’Aln',        'The third wing opens in Raid Finder.',     'La troisième aile ouvre à la Recherche de raid.',  NULL,  7,  0, 1452699, 1452699, 1452699, 0,   0, 'raid 7.0'),
 (205, 170, 170, 'Trial of Valor',                             'Le Jugement des Valeureux',                     'The raid opens in Raid Finder.',           'Le raid ouvre à la Recherche de raid.',            NULL,  7,  0, 1537288, 1537288, 1537288, 0,   0, 'raid 7.1'),
 (206, 171, 171, 'The Nighthold: Arcing Aqueducts',            'Le palais Sacrenuit : les Arcqueducs',          'The first wing opens in Raid Finder.',     'La première aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1452701, 1452701, 1452701, 0,   0, 'raid 7.1.5'),
 (207, 172, 172, 'The Nighthold: Royal Athenaeum',             'Le palais Sacrenuit : Athenaeum royal',         'The second wing opens in Raid Finder.',    'La deuxième aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1452704, 1452704, 1452704, 0,   0, 'raid 7.1.5'),
 (208, 173, 173, 'The Nighthold: Nightspire',                  'Le palais Sacrenuit : Nocteflèche',             'The third wing opens in Raid Finder.',     'La troisième aile ouvre à la Recherche de raid.',  NULL,  7,  0, 1452703, 1452703, 1452703, 0,   0, 'raid 7.1.5'),
 (209, 174, 174, 'The Nighthold: Betrayer’s Rise',             'Le palais Sacrenuit : l’ascension du Traître',  'The fourth wing opens in Raid Finder.',    'La quatrième aile ouvre à la Recherche de raid.',  NULL,  7,  0, 1452702, 1452702, 1452702, 0,   0, 'raid 7.1.5'),
 (210, 175, 175, 'Tomb of Sargeras: Wailing Halls',            'Tombe de Sargeras : salles des Lamentations',   'The first wing opens in Raid Finder.',     'La première aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1616163, 1616163, 1616163, 0,   0, 'raid 7.2.5'),
 (211, 176, 176, 'Tomb of Sargeras: Deceiver’s Fall',          'Tombe de Sargeras : la chute du Trompeur',      'The second wing opens in Raid Finder.',    'La deuxième aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1616157, 1616157, 1616157, 0,   0, 'raid 7.2.5'),
 (212, 177, 177, 'Tomb of Sargeras: Chamber of the Avatar',    'Tombe de Sargeras : chambre de l’Avatar',       'The third wing opens in Raid Finder.',     'La troisième aile ouvre à la Recherche de raid.',  NULL,  7,  0, 1616159, 1616159, 1616159, 0,   0, 'raid 7.2.5'),
 (213, 178, 178, 'Tomb of Sargeras: Gates of Hell',            'Tombe de Sargeras : les portes de l’enfer',     'The fourth wing opens in Raid Finder.',    'La quatrième aile ouvre à la Recherche de raid.',  NULL,  7,  0, 1616161, 1616161, 1616161, 0,   0, 'raid 7.2.5'),
 (214, 179, 179, 'Antorus: Light’s Breach',                    'Antorus : la Brèche de Lumière',                'The first wing opens in Raid Finder.',     'La première aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1718756, 1718756, 1718756, 0,   0, 'raid 7.3.2'),
 (215, 180, 180, 'Antorus: Forbidden Descent',                 'Antorus : la Descente interdite',               'The second wing opens in Raid Finder.',    'La deuxième aile ouvre à la Recherche de raid.',   NULL,  7,  0, 1718757, 1718757, 1718757, 0,   0, 'raid 7.3.2'),
 (216, 181, 181, 'Antorus: Hope’s End',                        'Antorus : la Fin de l’espoir',                  'The third wing opens in Raid Finder.',     'La troisième aile ouvre à la Recherche de raid.',  NULL,  7,  0, 1718758, 1718758, 1718758, 0,   0, 'raid 7.3.2'),
 (217, 182, 182, 'Antorus: Seat of the Pantheon',              'Antorus : le Siège du Panthéon',                'The fourth wing opens in Raid Finder.',    'La quatrième aile ouvre à la Recherche de raid.',  NULL,  7,  0, 1718759, 1718759, 1718759, 0,   0, 'raid 7.3.2'),
 (218, 183, 183, 'Cathedral of Eternal Night',                 'Cathédrale de la Nuit éternelle',               'The dungeon opens its doors.',             'Le donjon ouvre ses portes.',                      NULL,  7,  0, 1616925, 1616925, 1616925, 0,   0, 'dungeon 7.2'),
 (219, 184, 184, 'Seat of the Triumvirate',                    'Siège du triumvirat',                           'The dungeon opens its doors.',             'Le donjon ouvre ses portes.',                      NULL,  7,  0, 1718526, 1718526, 1718526, 0,   0, 'dungeon 7.3'),
 (220, 185, 185, 'Assault on Broken Shore',                    'L’assaut du rivage Brisé',                      'The Broken Shore campaign begins.',        'La campagne du rivage Brisé commence.',            NULL, 14,  0, 1467047, 1467046, 1467045, 0,   0, 'zone 7.2'),
 (221, 186, 186, 'Argus',                                      'Argus',                                         'Argus opens for exploration.',             'Argus s’ouvre à l’exploration.',                   NULL, 14,  0, 1718525, 1718525, 1718525, 0,   0, 'zone 7.3'),
 (222, 187, 187, 'Demon Invasion - Azeroth',                   'Invasion de Démons - Azeroth',                  'The Legion’s portals open upon Azeroth.',  'Les portails de la Légion s’ouvrent sur Azeroth.', NULL, 14, 30, 1243535, 1243535, 1243535, 0, 811, 'evenement mondial ; carte des zones envahies : 1243609');
