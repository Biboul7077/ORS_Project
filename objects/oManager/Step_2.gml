if keyboard_check_pressed(vk_escape)
{
	global.gamePaused = !global.gamePaused;
	
	if global.gamePaused
	{
		with (all)
		{
			gamePausedImgSpd = image_speed;
			gamePausedSpd = speed;
			image_speed = 0;
			speed = 0;
		}
	} else {
		{
			with (all)
			{
				image_speed = gamePausedImgSpd;
				speed = gamePausedSpd;
			}
		}
	}
}