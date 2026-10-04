-- Aessina's Miracle (25372): the reward text of the default table was mis-encoded Russian, the English one sat in frFR.
-- English text from TDB 12.1, reward and request texts translated into French.

UPDATE `quest_offer_reward` SET `RewardText` = 'This is the key, $n! With the seedlings you collected for me earlier, the animals you''ve saved from around Hyjal, and the Heart of the Forest you''ve just discovered, we can rejuvenate this land right from under the feet of Twilight''s Hammer. Imagine their astonishment to see their work undone, as life triumphs over chaos...$B$BI will begin the ceremony at once!' WHERE `ID` = 25372;

DELETE FROM `quest_offer_reward_locale` WHERE `ID` = 25372 AND `Locale` = 'frFR';
INSERT INTO `quest_offer_reward_locale` (`ID`, `Locale`, `OfferRewardText`, `VerifiedBuild`) VALUES
(25372, 'frFR', 'Voilà la clé, $n ! Grâce aux jeunes pousses que vous avez récoltées pour moi, aux animaux que vous avez sauvés aux quatre coins d''Hyjal et au Cœur de la forêt que vous venez de découvrir, nous allons pouvoir faire renaître cette terre sous les pieds mêmes du Marteau du crépuscule. Imaginez leur stupeur en voyant leur œuvre réduite à néant, tandis que la vie triomphe du chaos...$B$BJe commence la cérémonie sans plus attendre !', 0);

DELETE FROM `quest_request_items_locale` WHERE `ID` = 25372 AND `Locale` = 'frFR';
INSERT INTO `quest_request_items_locale` (`ID`, `Locale`, `CompletionText`, `VerifiedBuild`) VALUES
(25372, 'frFR', 'Je ne sais plus à quel esprit me vouer, $n ! Aessina reste muette.$B$BAvez-vous trouvé quelque chose ? Qu''est-ce donc ?', 0);
