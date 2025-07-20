function Player_Shoot()
{
	with oRifle
	{
		kReload = keyboard_check_pressed(ord("R"));

		image_angle = point_direction(x,y,mouse_x,mouse_y);
		var _lengthX = lengthdir_x(sprite_width,image_angle);
		var _lengthY = lengthdir_y(sprite_width,image_angle);

		firing_delay -= 1;
		reload_delay -= 1;
		recoil = max(0,recoil - 1);

		if (mouse_check_button_pressed(mb_left)) && firing_delay < 0 && reload_delay < 0
		{
			if global.ammo > 0
			{
				recoil = 4;
				firing_delay = 8;
				global.ammo -= 1;
				with instance_create_layer(x+_lengthX,y+_lengthY,"Inst_Entity",oBullet)
				{
					speed = 12;
					direction = other.image_angle + random_range(-3,3);
					image_angle = direction;
					with instance_create_depth(x,y,depth-1,oParticles) {
						sprite_index	= sShoot_Animation;
						image_angle		= other.image_angle;
						fric = 0.8;
					}
				}
			}
		}

		if kReload
		{
			reload_delay = 80 - global.ammo * 20;
			reloading = true;
		}

		if reloading
		{
			if reload_delay < 0 reloading = false;
			else global.ammo = (80 - reload_delay) / 20;
		}

		x = x - lengthdir_x(recoil,image_angle);
		y = y - lengthdir_y(recoil,image_angle);

		if image_angle > 90 && image_angle < 270
		{
			image_yscale = -1;
		} else {
			image_yscale = 1;
		}
	}
}