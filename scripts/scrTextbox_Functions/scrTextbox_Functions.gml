function SetDefaultText()
{
	line_break_pos[0, pageNumber] = 999;
	line_break_num[pageNumber] = 0;
	line_break_offset[pageNumber] = 0;
	
	for (var c = 0; c < 999; c++)
	{
		col1[c, pageNumber] = c_white;
		col2[c, pageNumber] = c_white;
		col3[c, pageNumber] = c_white;
		col4[c, pageNumber] = c_white;
		
		float_text[c, pageNumber] = false;
		float_dir[c, pageNumber] = c * 20;
		
		shake_text[c, pageNumber] = false;
		shake_dir[c, pageNumber] = irandom(360);
		shake_timer[c, pageNumber] = irandom(4);
		
		censored_text[c, pageNumber] = false;
		censored_timer[c, pageNumber] = irandom(4);
	}
	
	textbox_sprite[pageNumber] = sTextbox;
	speaker_sprite[pageNumber] = noone;
	speaker_audio[pageNumber] = noone;
}

function SetColorText(_start, _end, _col1, _col2, _col3, _col4 )
{
	for (var c = _start; c < _end; c++)
	{
		col1[c, pageNumber - 1] = _col1;
		col2[c, pageNumber - 1] = _col2;
		col3[c, pageNumber - 1] = _col3;
		col4[c, pageNumber - 1] = _col4;
	}
}

function SetFloatText(_start, _end)
{
	for (var c= _start; c < _end; c++)
	{
		float_text[c, pageNumber - 1] = true;
	}
}

function SetShakeText(_start, _end)
{
	for (var c= _start; c < _end; c++)
	{
		shake_text[c, pageNumber - 1] = true;
	}
}

function SetCensoredText(_start, _end)
{
	for (var c= _start; c < _end; c++)
	{
		censored_text[c, pageNumber - 1] = true;
	}
}

function TextSetup(_text, _character = noone, _expression = noone)
{
	SetDefaultText();
	
	text[pageNumber] = Text(_text);
	
	switch (_character)
	{
		case CHARACTER.DOC_S:
			speaker_sprite[pageNumber]	= sDocS;
			textbox_sprite[pageNumber]	= sTextbox;
			speaker_audio[pageNumber] = sndDialogueTest;
			break;
		default:
			speaker_sprite[pageNumber]	= noone;
			textbox_sprite[pageNumber]	= sTextbox;
			speaker_audio[pageNumber] = sndDialogueTest;
			break;
	}
	speaker_image[pageNumber]	= _expression;
	
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