/// TEXTBOX VARIABLES
textbox_sprite[0] = sTextbox;
textbox_img = 0;
textbox_img_spd = 0;

textbox_spr_w = sprite_get_width(textbox_sprite[0]);

textbox_w = 16;
textbox_h = 3;
border = 8;
line_sep = 12;
line_width = (textbox_w * textbox_spr_w) - border * 2;

/// TEXT
page = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;

///SOUND
snd_delay = 4;
snd_count = snd_delay;

/// OPTIONS
option[0] = -1;
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

/// EFFECTS
SetDefaultText();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;