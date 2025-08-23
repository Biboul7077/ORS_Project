function Player_Collision(_checkingX = false, _checkingY = false)
{
	var _collisionCheck = false;

	if place_meeting(x+hsp,y,oCol) {
		while !place_meeting(x+sign(hsp),y,oCol) {
			x = x + sign(hsp)
		}
		hsp = 0;
		if _checkingX _collisionCheck = true;
	}
	x = x + hsp;

	if place_meeting(x,y+vsp,oCol) {
		while !place_meeting(x,y+sign(vsp),oCol) {
			y = y + sign(vsp)
		}
		vsp = 0;
		if _checkingY _collisionCheck = true;
	}
	y = y + vsp;
	
	return _collisionCheck;
}