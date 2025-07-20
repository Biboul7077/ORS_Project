var percentHp = 1 - global.hp/6

if instance_exists(oPlayer) {
	draw_sprite(sHUD_Bg, 0, healthbar_x, healthbar_y);
	for (var i = 0; i < healthbar_w * percentHp; i += 2)
	{
		var r = 255;
		var g = min(1, 2 * i/healthbar_w)*255;
		var b = max(0, 4 * i/healthbar_w - 3)*255;

		global.color = make_colour_rgb(r,g,b);
		draw_sprite_ext(sHealthbar,0,healthbar_x + i,healthbar_y,1,1,0,global.color,1);
	}
	draw_sprite(sHUD_Ammo, global.ammo, healthbar_x, healthbar_y);
	draw_set_color(c_lime);
	draw_set_font(Fnt_Name);
	draw_text(healthbar_x, healthbar_y+36, "$ " + string(global.coin));
}