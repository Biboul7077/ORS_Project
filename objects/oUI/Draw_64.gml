var percentHp = 1 - global.hp/6

if instance_exists(oPlayer) {
	draw_set_alpha(1);
	for (var i = 0; i < 100 * percentHp; i++)
	{
		var r = 255;
		var g = min(1, 2 * i/100)*255;
		var b = max(0, 4 * i/100 - 3)*255;

		global.color = make_colour_rgb(r,g,b);
	}
	draw_sprite_ext(sHUD_healthbar_back, 0, healthbar_x, healthbar_y, 1,1,0,global.color,1);
	draw_sprite(sHUD_healthbar_border, global.ammo, healthbar_x, healthbar_y);
	draw_set_color(c_lime);
	draw_set_font(Fnt_Name);
	draw_text(healthbar_x, healthbar_y+36, "$ " + string(global.coin));
}

///Pause Screen
if global.gamePaused
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fntText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "... GAME PAUSED ...");
	for (var i = 0; i < array_length(pauseOption); i++)
	{
	    var _print = "";
		if i == pauseOptionSelected
		{
			_print += $"> {pauseOption[i]} <";
		}
		else
		{
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 28 + (i * 16), _print);
		draw_set_alpha(1.0);
	}
}