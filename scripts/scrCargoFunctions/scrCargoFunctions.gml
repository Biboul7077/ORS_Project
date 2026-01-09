function CargoWander()
{
	sprite_index = sprMove;
	
	if x == xTo || timePassed > enemyWanderDistance/enemySpeed
	{
		sprite_index = sprIdle;
		
		hsp = 0;
		
		if ++wait >= waitDuration
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
		}
	}
	else
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x,y,xTo,y);
		var _speedThisFrame = enemySpeed;
		if _distanceToGo < enemySpeed _speedThisFrame = _distanceToGo;
		dir = point_direction(x,y,xTo,y);
		hsp = lengthdir_x(_speedThisFrame, dir);
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
			xTo = oPlayer.x;
		}
	}
}

function CargoHurt()
{
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,y);
	var _hurtSpeed = enemySpeed * 3;
	if _distanceToGo > _hurtSpeed
	{
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,y);
		hsp = lengthdir_x(_hurtSpeed,dir);
		if hsp != 0 image_xscale = -sign(hsp);
		
		var _collided = Enemy_Collision();
		if _collided
		{
			xTo = x;
		}
	}
	else
	{
		x = xTo;
		flashAlpha = 0;
		state = ENEMYSTATE.WANDER;
		target = oPlayer;
	}
}

function CargoDie()
{
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x,y,xTo,y);
	if _distanceToGo > enemySpeed
	{
		dir = point_direction(x,y,xTo,y);
		hsp = lengthdir_x(enemySpeed,dir);
		if hsp != 0 image_xscale = -sign(hsp);
		
		var _collided = Enemy_Collision();
		if _collided
		{
			xTo = x;
		}
	}
	else
	{
		x = xTo;
	}
	
	if image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number
	{
		instance_destroy();
	}
}

function CargoChase()
{
	sprite_index = sprMove;
	timer++;
	
	var _distanceToGo = point_distance(x,y,xTo,y);
	var _speedThisFrame = enemySpeed * 5;
	image_speed = 1.0;
	dir = point_direction(x,y,xTo,y);
	if _distanceToGo > _speedThisFrame
	{
		hsp = lengthdir_x(_speedThisFrame, dir);
	}
	else
	{
		hsp = lengthdir_x(_distanceToGo, dir);
	}
	if hsp != 0 image_xscale = sign(hsp)
	
	var _collided = Enemy_Collision();
	if _collided || x == xTo
	{
		stateTarget = ENEMYSTATE.WANDER;
		state = ENEMYSTATE.WAIT;
	}
}