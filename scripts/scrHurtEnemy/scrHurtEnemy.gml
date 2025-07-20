function HurtEnemy(_enemy, _damage, _source, _knockback)
{
	with(_enemy)
	{
		if state != ENEMYSTATE.DIE
		{
			enemyHP -= _damage;
			flashAlpha = 1;
			
			if enemyHP <= 0
			{
				state = ENEMYSTATE.DIE;
				ScreenShake(8, 15);
			}
			else
			{
				if state != ENEMYSTATE.HURT statePrevious = state;
				state = ENEMYSTATE.HURT;
				ScreenShake(4, 5);
			}
			
			image_index = 0;
			if _knockback != 0
			{
				var _knockDir = point_direction(x,y,_source.x,_source.y);
				xTo = x - lengthdir_x(_knockback, _knockDir);
				yTo = y - lengthdir_y(_knockback, _knockDir);
			}
		}
	}
}