function SetDefaultText()
{
	line_break_pos[0, pageNumber] = 999;
	line_break_num[pageNumber] = 0;
	line_break_offset[pageNumber] = 0;
}

function TextSetup(_text)
{
	SetDefaultText();
	
	text[pageNumber] = Text(_text);
	
	pageNumber++;
}

function OptionSetup(_option, _linkID)
{
	option[option_number] = _option;
	option_link_id[option_number] = _linkID;
	
	option_number++;
}

function CreateTextbox(_textID)
{
	with instance_create_depth(0,0, -9999, oTextbox)
	{
		DialogueRepertory(_textID);
	}
}