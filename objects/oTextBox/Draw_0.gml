var accept_key = keyboard_check_pressed(vk_space);

var textbox_x = camera_get_view_x(view_camera[0]);
var textbox_y = camera_get_view_y(view_camera[0]) + 288;

if setup == false
{
	setup = true
	draw_set_font(global.fntTextboxes);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for (var page = 0; page < pageNumber; page++)
	{
		text_length[page] = string_length(text[page]);
		text_x_offset[page] = 128;
	}
}

if draw_char < text_length[pages]
{
	draw_char += global.textSpd;
	draw_char = clamp(draw_char, 0, text_length[pages])
}

if accept_key
{
	if draw_char == text_length[pages]
	{
		if pages < pageNumber - 1
		{
			pages++;
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
		draw_char = text_length[pages];
	}
}

textbox_img += textbox_img_spd;

draw_sprite_ext(
	textbox_sprite,
	textbox_img,
	textbox_x + text_x_offset[pages],
	textbox_y,
	textbox_w,
	textbox_h,
	0,
	c_white,
	1
);

if draw_char == text_length[pages] && pages == pageNumber - 1
{
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	var _opSpace = 32;
	var _opBorder = 4;
	
	for (var op = 0; op < option_number; op++)
	{
		var _opSide = (sprite_get_width(sPlayer_Reaction) + _opBorder*2)/textbox_spr_w;
		draw_sprite_ext(textbox_sprite, textbox_img, textbox_x + 14, textbox_y - _opSpace*option_number + _opSpace*op, _opSide, _opSide, 0, c_white, 1);
		draw_sprite(sPlayer_Reaction, option[op], textbox_x + 14 + _opBorder, textbox_y - _opSpace*option_number + _opSpace*op + _opBorder);
		
		if option_pos == op
		{
			draw_sprite(sTarget, 0, textbox_x + 14 + _opBorder, textbox_y - _opSpace*option_number + _opSpace*op + _opBorder);
		}
	}
}

var textToDraw = string_copy(text[pages], 1, draw_char);
draw_text_ext(
	textbox_x + 128 + border,
	textbox_y + border,
	textToDraw,
	line_sep,
	line_width
);