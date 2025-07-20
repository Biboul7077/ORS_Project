function Player_StateBonk()
{
	hsp = sign(lengthdir_x(bonkSpd, direction-180));
	vsp = sign(lengthdir_y(bonkSpd, direction-180));
	
	moveDistRemain = max(0,moveDistRemain - bonkSpd);
	var _collided = Player_Collision();
	
	sprite_index = spriteHurt;
	
	if moveDistRemain <= 0
	{
		state = Player_StateFree;
		flashAlpha = 0;
	}
}