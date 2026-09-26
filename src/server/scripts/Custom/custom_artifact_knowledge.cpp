/*
 * Artifact Knowledge - custom content (non-retail)
 *
 * Catch-up quest for alts: turning the quest in raises the character's Artifact Knowledge
 * to rank 10 at once. The quest availability is filtered in SQL by the `conditions` table
 * (max level + CONDITION_ACCOUNT_ARTIFACT_KNOWLEDGE: the account must already own a
 * max-level character with at least 25 Artifact Knowledge ranks).
 */

#include "ScriptMgr.h"
#include "Player.h"
#include "QuestDef.h"
#include "DB2Stores.h"

enum ArtifactKnowledgeCatchup
{
    QUEST_ARTIFACT_KNOWLEDGE_CATCHUP = 316999,
    ARTIFACT_KNOWLEDGE_CATCHUP_RANK  = 10
};

class player_artifact_knowledge_catchup : public PlayerScript
{
public:
    player_artifact_knowledge_catchup() : PlayerScript("player_artifact_knowledge_catchup") {}

    void OnQuestReward(Player* player, Quest const* quest) override
    {
        if (!player || !quest || quest->GetQuestId() != QUEST_ARTIFACT_KNOWLEDGE_CATCHUP)
            return;

        uint32 knowledgeLevel = player->GetCurrency(CURRENCY_TYPE_ARTIFACT_KNOWLEDGE);
        if (knowledgeLevel >= ARTIFACT_KNOWLEDGE_CATCHUP_RANK)
            return;

        uint32 precision = uint32(sDB2Manager.GetCurrencyPrecision(CURRENCY_TYPE_ARTIFACT_KNOWLEDGE));
        player->ModifyCurrency(CURRENCY_TYPE_ARTIFACT_KNOWLEDGE, (ARTIFACT_KNOWLEDGE_CATCHUP_RANK - knowledgeLevel) * precision);
    }
};

void AddSC_custom_artifact_knowledge()
{
    new player_artifact_knowledge_catchup();
}
