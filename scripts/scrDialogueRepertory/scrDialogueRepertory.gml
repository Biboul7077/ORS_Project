function DialogueRepertory(_textID)
{
	switch (_textID)
	{
		case "npc_1":
			TextSetup("call_S")
			OptionSetup(REACTION.HAPPY, "npc_1 - deaf");
			OptionSetup(REACTION.ANGRY, "npc_1 - deaf");
			break;
		
		case "npc_1 - deaf":
			TextSetup("ans_S")
			break;
	}
}