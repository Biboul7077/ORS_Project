function Player_Collision()
{
	var _collision = false;

	if place_meeting(x+hsp,y,oCol) {
		while !place_meeting(x+sign(hsp),y,oCol) {
			x = x + sign(hsp)
		}
		hsp = 0;
		_collision = true;
	}
	x = x + hsp;

	if place_meeting(x,y+vsp,oCol) {
		while !place_meeting(x,y+sign(vsp),oCol) {
			y = y + sign(vsp)
		}
		vsp = 0;
		_collision = true;
	}
	y = y + vsp;
}