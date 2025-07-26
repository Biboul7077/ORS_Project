var accept_key = keyboard_check_pressed(vk_space);

var textbox_x = camera_get_view_x(view_camera[0]);
var textbox_y = camera_get_view_y(view_camera[0]) + 288;

/// SETUP
if setup == false
{
	setup = true
	draw_set_font(global.fntTextboxes);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for (var p = 0; p < pageNumber; p++)
	{
		text_length[p] = string_length(text[p]);
		text_x_offset[p] = 128;
		
		for (var c = 0; c < text_length[p]; c++)
		{
			var _charPos = c + 1;
			char[c, p] = string_char_at(text[p], _charPos);
			
			var _textUpToChar = string_copy(text[p], 1, _charPos);
			var _currentTextWidth = string_width(_textUpToChar) - string_width(char[c, p]);
			
			if char[c, p] == " "
			{
				last_free_space = _charPos + 1
			}
			
			if _currentTextWidth - line_break_offset[p] > line_width
			{
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _textUpToLastSpace = string_copy(text[p], 1, last_free_space);
				var _lastFreeSpaceString = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_textUpToLastSpace) - string_width(_lastFreeSpaceString);
			}
		}
		
		for (var c = 0; c < text_length[p];  c++)
		{
			var _charPos = c + 1;
			var _textX = textbox_x + text_x_offset[p] + border;
			var _textY = textbox_y + border;
			var _textUpToChar = string_copy(text[p], 1, _charPos);
			var _currentTextWidth = string_width(_textUpToChar) - string_width(char[c, p]);
			var _textLine = 0;
			
			for (var lineBreak = 0; lineBreak < line_break_num[p]; lineBreak++)
			{
				if _charPos >= line_break_pos[lineBreak, p]
				{
					var _str_copy = string_copy(text[p], line_break_pos[lineBreak, p], _charPos - line_break_pos[lineBreak, p]);
					_currentTextWidth = string_width(_str_copy);
				
					_textLine = lineBreak + 1;
				}
			}
			
			char_x[c, p] = _textX + _currentTextWidth;
			char_y[c, p] = _textY + _textLine * line_sep;
		}
	}
}

if draw_char < text_length[page]
{
	draw_char += global.textSpd;
	draw_char = clamp(draw_char, 0, text_length[page])
}

if accept_key
{
	if draw_char == text_length[page]
	{
		if page < pageNumber - 1
		{
			page++;
			draw_char = 0;
		}
		else
		{
			if option_number > 0
			{
				CreateTextbox(option_link_id[option_pos]);
			}
			else
			{
				oPlayer.state = Player_StateFree;
			}
			instance_destroy();
		}
	}
	else
	{
		draw_char = text_length[page];
	}
}

textbox_img += textbox_img_spd;

draw_sprite_ext(
	textbox_sprite,
	textbox_img,
	textbox_x + text_x_offset[page],
	textbox_y,
	textbox_w,
	textbox_h,
	0,
	c_white,
	1
);

if draw_char == text_length[page] && page == pageNumber - 1
{
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	var _opSpace = 48;
	var _opBorder = 4;
	var _opX = textbox_x + text_x_offset[0] + textbox_w * textbox_spr_w;
	var _opY = textbox_y - _opSpace;
	
	for (var op = 0; op < option_number; op++)
	{
		var _opSide = (sprite_get_width(sPlayer_Reaction) + _opBorder*2)/textbox_spr_w;
		var _opSpaces = _opSpace*option_number - _opSpace*op;
		draw_sprite_ext(textbox_sprite, textbox_img, _opX - _opSpaces, _opY, _opSide, _opSide, 0, c_white, 1);
		draw_sprite(sPlayer_Reaction, option[op], _opX - _opSpaces + _opBorder, _opY + _opBorder);
		
		if option_pos == op
		{
			draw_sprite(sSelectOption, 0, _opX - _opSpaces + _opBorder, _opY + _opBorder);
		}
	}
}

for (var c = 0; c < draw_char; c++)
{
	draw_text(char_x[c, page], char_y[c, page], char[c, page]);
}