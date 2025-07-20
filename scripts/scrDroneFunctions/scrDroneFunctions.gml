function DroneChase()
{
	sprite_index = sprMove;
	
	if instance_exists(target)
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed * 2;
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if _distanceToGo > _speedThisFrame
		{
			hsp = lengthdir_x(_speedThisFrame, dir);
			vsp = lengthdir_y(_speedThisFrame, dir);
		}
		else
		{
			hsp = lengthdir_x(_distanceToGo, dir);
			vsp = lengthdir_y(_distanceToGo, dir);
		}
		if hsp != 0 image_xscale = sign(hsp)
		
		var _collided = Enemy_Collision();
	}
}

function DroneWander()
{
	sprite_index = sprMove;
	
	if x == xTo && y == yTo || timePassed > enemyWanderDistance/enemySpeed
	{
		sprite_index = sprIdle;
		
		hsp = 0;
		vsp = 0;
		
		if ++wait >= waitDuration
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	}
	else
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if _distanceToGo < enemySpeed _speedThisFrame = _distanceToGo;
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(_speedThisFrame, dir);
		vsp = lengthdir_y(_speedThisFrame, dir);
		if hsp != 0 image_xscale = sign(hsp);
		
		var _collided = Enemy_Collision();
	}
	
	//Check for aggro
	if ++aggroCheck >= aggroCheckDuration
	{
		aggroCheck = 0;
		if instance_exists(oPlayer) && point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius
		{
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
	}
}

function DroneHurt()
{
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	var _hurtSpeed = enemySpeed * 3;
	if _distanceToGo > _hurtSpeed
	{
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(_hurtSpeed,dir);
		vsp = lengthdir_y(_hurtSpeed,dir);
		if hsp != 0 image_xscale = -sign(hsp);
		
		var _collided = Enemy_Collision();
		if _collided
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		flashAlpha = 0;
		state = ENEMYSTATE.CHASE;
		target = oPlayer;
	}
}

function DroneDie()
{
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if _distanceToGo > enemySpeed
	{
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(enemySpeed,dir);
		vsp = lengthdir_y(enemySpeed,dir);
		if hsp != 0 image_xscale = -sign(hsp);
		
		var _collided = Enemy_Collision();
		if _collided
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	
	if image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number
	{
		instance_destroy();
	}
}