if invincible != 0 && (invincible mod 8 < 2) == 0 && flashAlpha == 0
{
	//skip draw
} else {
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha);
	
	if flashAlpha > 0
	{
		shader_set(shFlash);
		draw_sprite_ext(
			sprite_index,
			image_index,
			floor(x),
			floor(y),
			image_xscale,
			image_yscale,
			image_angle,
			flashColor,
			flashAlpha);
	}
}

if shader_current() != -1 shader_reset();