function HurtPlayer(_force,_damage)
{
	if oPlayer.invincible <= 0 && oPlayer.state != Player_StateRoll
	{
		global.hp = max(0, global.hp - _damage);
		
		if global.hp > 0
		{
			with oPlayer
			{
				state = Player_StateBonk;
				direction = point_direction(other.x, y, x, y + bonkHeight) - 180;
				moveDistRemain = _force;
				ScreenShake(2,10);
				flashAlpha = 1;
				flashColor = global.color;
				invincible = 60
			}
		}
		else
		{
			//kill the player
		}
	}
}