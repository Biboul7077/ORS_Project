var _idEnemy = other.id;
with instance_create_depth(x,y,depth-1,oParticles)
{
	sprite_index	= sHit_Animation;
	image_angle		= other.image_angle;
	fric	= 0.5;
}

with _idEnemy
{
	hp -= global.dmg;
	flashAlpha = 1;
	if hp <= 0 hp = 0;
	var _percentageHp = hp/maxHp;
	flashColor = make_colour_rgb(255, 255 * (1 - _percentageHp), 255 * (_percentageHp < 0.15));
	repeat(irandom_range(4,7))
	{
		with instance_create_depth(x, y, depth-1, oParticles)
		{
			sprite_index	= sDust;
			image_angle		= random(360);
			image_blend		= _idEnemy.flashColor;
			fric	= 0.9;
			motion_add(image_angle,random_range(-7,-11));
		}
	}
	with instance_create_depth(x, y, depth-1, oParticles)
	{
		sprite_index	= sEnemy_ShieldWave;
		image_blend		= _idEnemy.flashColor;
		fric	= 0.9;
	}
	show_debug_message(flashColor);
}
instance_destroy();