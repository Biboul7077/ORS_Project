if instance_exists(oPlayer) && position_meeting(oPlayer.x, oPlayer.y, id)
{
	global.targetRoom	= targetRoom;
	global.targetX		= targetX;
	global.targetY		= targetY;
	global.targetDir	= oPlayer.inputDir;
	
	with oPlayer state = Player_StateTransition;
	RoomTransition(TRANS_TYPE.FADE, targetRoom, text)
	instance_destroy();
}