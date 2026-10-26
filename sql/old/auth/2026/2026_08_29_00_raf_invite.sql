-- ---------------------------------------------------------------------------------------------
-- Parrainage : invitations en attente de confirmation.
--
-- Le client 7.3.5 envoie une invitation par adresse e-mail (CMSG_RECRUIT_A_FRIEND), mais il n'a
-- aucune interface pour l'accepter ou la refuser : sur retail, la recrue acceptait implicitement
-- en creant son compte depuis le lien recu par courriel. Sans service d'envoi, on resout l'adresse
-- directement dans `account` et on cree une invitation en attente.
--
-- Tant que `status` vaut 0, `account.recruiter` reste vide et aucun bonus ne s'applique. Le lien
-- n'est ecrit qu'a l'acceptation.
-- ---------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `account_raf_invite` (
  `id`              INT UNSIGNED     NOT NULL AUTO_INCREMENT,
  `recruiter_id`    INT UNSIGNED     NOT NULL                COMMENT 'compte qui invite',
  `recruited_id`    INT UNSIGNED     NOT NULL                COMMENT 'compte invite, resolu par email',
  `recruited_email` VARCHAR(254)     NOT NULL                COMMENT 'adresse saisie dans l interface',
  `note`            VARCHAR(255)     NOT NULL DEFAULT ''     COMMENT 'message libre du parrain',
  `status`          TINYINT UNSIGNED NOT NULL DEFAULT 0      COMMENT '0 en attente, 1 accepte, 2 refuse',
  `created_at`      TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `responded_at`    TIMESTAMP        NULL     DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_recruited` (`recruited_id`, `status`),
  KEY `idx_recruiter` (`recruiter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Invitations de parrainage en attente';
