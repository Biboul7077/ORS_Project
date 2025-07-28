function DialogueRepertory(_textID)
{
	switch (_textID)
	{
		case "npc_1":
			var _start = 0;
			var _end = 0;
			TextSetup("call_S", CHARACTER.DOC_S, EXPRESSION.SHY);
			switch (global.locale)
			{
				case LOCALE.EN:
					_start = 30;
					_end = 34;
					break;
				case LOCALE.FR:
					_start = 31;
					_end = 39;
					break;
				case LOCALE.DE:
					_start = 30;
					_end = 35;
					break;
			}
			SetColorText(_start, _end, c_lime, c_lime, c_lime, c_lime);
			SetFloatText(_start, _end);
			OptionSetup(REACTION.HAPPY, "npc_1 - pos_ans");
			OptionSetup(REACTION.ANGRY, "npc_1 - neg_ans");
			break;
		
		case "npc_1 - pos_ans":
			TextSetup("positive_ans_S", CHARACTER.DOC_S, EXPRESSION.HAPPY);
			break;
		
		case "npc_1 - neg_ans":
			TextSetup("negative_ans_S", CHARACTER.DOC_S, EXPRESSION.EMBARASSED);
			switch (global.locale)
			{
				case LOCALE.EN:
					_start = 7;
					_end = 15;
					break;
				case LOCALE.FR:
					_start = 0;
					_end = 14;
					break;
				case LOCALE.DE:
					_start = 0;
					_end = 7;
					break;
			}
			SetColorText(_start, _end, c_red, c_red, c_red, c_red);
			SetShakeText(_start, _end);
			break;
	}
}