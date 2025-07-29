function DialogueRepertory(_textID)
{
	switch (_textID)
	{
		case "npc_1":
			TextSetup("call_S", CHARACTER.DOC_S, EXPRESSION.SHY);
			OptionSetup(REACTION.HAPPY, "npc_1 - pos_ans");
			OptionSetup(REACTION.ANGRY, "npc_1 - neg_ans");
			break;
		
		case "npc_1 - pos_ans":
			TextSetup("positive_ans_S", CHARACTER.DOC_S, EXPRESSION.HAPPY);
			TextSetup("call_next_S", CHARACTER.DOC_S, EXPRESSION.SHY);
			TextSetup("run_out_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("warn_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("call_end_S", CHARACTER.DOC_S, EXPRESSION.HAPPY);
			break;
		
		case "npc_1 - neg_ans":
			TextSetup("negative_ans_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("call_next_S", CHARACTER.DOC_S, EXPRESSION.SHY);
			TextSetup("run_out_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("warn_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			TextSetup("call_end_S_mad", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			break;
	}
}