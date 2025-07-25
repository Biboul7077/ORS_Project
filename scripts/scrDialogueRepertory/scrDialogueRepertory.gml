function DialogueRepertory(_textID)
{
	switch (_textID)
	{
		case "npc_1":
			TextSetup("call_S")
			OptionSetup(REACTION.HAPPY, "npc_1 - pos_ans");
			OptionSetup(REACTION.ANGRY, "npc_1 - neg_ans");
			break;
		
		case "npc_1 - pos_ans":
			TextSetup("positive_ans_S");
			break;
		
		case "npc_1 - neg_ans":
			TextSetup("negative_ans_S");
			break;
	}
}