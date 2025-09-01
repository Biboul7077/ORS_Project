function DialogueRepertory(_textID)
{
	switch (_textID)
	{
		case "npc_1":
			TextSetup("NAR_call_S");
			TextSetup("INTRO_call_S", CHARACTER.DOC_S, EXPRESSION.SHY);
			OptionSetup(REACTION.EXCITED, "npc_1 - pos_ans");
			OptionSetup(REACTION.ANGRY, "npc_1 - neg_ans");
			break;
		
		case "npc_1 - pos_ans":
			TextSetup("ANS_pos_S", CHARACTER.DOC_S, EXPRESSION.HAPPY);
			TextSetup("INTER_Agent", CHARACTER.DOC_S, EXPRESSION.SHY);
			SetCensoredText(10, 18);
			TextSetup("END_call_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("END_Agent", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("NAR_end_call_S", CHARACTER.DOC_S, EXPRESSION.HAPPY);
			break;
		
		case "npc_1 - neg_ans":
			TextSetup("ANS_neg_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("INTER_Agent", CHARACTER.DOC_S, EXPRESSION.SHY);
			TextSetup("END_call_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("END_Agent", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("NAR_end_call_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			break;
	}
}