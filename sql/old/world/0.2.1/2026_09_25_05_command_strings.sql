-- Texts some GM commands use but the table never had: they showed <error>.
-- 1029 .account create without an email, 1151-1156 .list mail, 27000-27002 notices to online GMs for .mute, .unmute and .ban
DELETE FROM `trinity_string` WHERE `entry` IN (1029, 1151, 1152, 1153, 1154, 1155, 1156, 27000, 27001, 27002);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc2`) VALUES
(1029, 'The account name must be an email address (name@domain).', 'Le nom du compte doit être une adresse e-mail (nom@domaine).'),
(1151, '%u mail(s) for %s (%s):', '%u courrier(s) pour %s (%s) :'),
(1152, 'Mail %u: %s, money: %ug %us %uc', 'Courrier %u : %s, argent : %u po %u pa %u pc'),
(1153, 'From %s (%u) to %s (%u)', 'De %s (%u) à %s (%u)'),
(1154, 'Delivered: %s, expires: %s', 'Remis : %s, expire : %s'),
(1155, 'Item: %s (entry %u, guid %u) x%u', 'Objet : %s (entrée %u, guid %u) x%u'),
(1156, 'No mail found.', 'Aucun courrier trouvé.'),
(27000, '%s was muted for %u minutes by %s. Reason: %s', '%s a été rendu muet pour %u minutes par %s. Raison : %s'),
(27001, '%s was unmuted by %s.', '%s peut de nouveau parler, rétabli par %s.'),
(27002, '%s was banned for %s by %s. Reason: %s', '%s a été banni pour %s par %s. Raison : %s');
