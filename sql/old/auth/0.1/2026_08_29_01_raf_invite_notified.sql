-- ---------------------------------------------------------------------------------------------
-- Recruit-A-Friend: remember whether an invitation has already been announced in chat.
--
-- The addon opens a dialog, but nothing guarantees the recruit runs it, and a dismissed dialog
-- leaves no trace. The server therefore also announces invitations in chat, and needs to tell a
-- brand new one ("you have received a request") from one the player has already been told about
-- ("you have a pending request"). See WorldSession::SendRafInviteNotification.
-- ---------------------------------------------------------------------------------------------

ALTER TABLE `account_raf_invite`
  ADD COLUMN `notified` TINYINT UNSIGNED NOT NULL DEFAULT 0
  COMMENT '1 once the recruit has been told about this invitation in chat' AFTER `status`;
