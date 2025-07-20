function Player_StateRoll(){
	hsp = lengthdir_x(image_xscale * spdRoll, image_xscale);
	vsp = vsp + grv;
	
	moveDistRemain = max(0, moveDistRemain - spdRoll);
	var _collided = Player_Collision();
	
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index);
	image_index = min(_totalFrames * (1 - (moveDistRemain / distRoll)), _totalFrames - 1);
	
	if moveDistRemain <= 0
	{
		state = Player_StateFree;
	}
	
	if _collided
	{
		state = Player_StateFree;
		ScreenShake(8, 30);
	}
}