function Player_StateFree(){
	hsp = lengthdir_x(inputMag * spdWalk, inputDir)
	vsp = vsp + grv;

	if onGround or inWater
	{
		jumpCount = 0;
	} else {
		if jumpCount = 0 jumpCount = 1;
	}

	if kJump && jumpCount < jumpMax
	{
		jumpCount++;
		jumpTimer = jumpHoldFrames;
	}

	if !kHoldJump jumpTimer = 0;

	if jumpTimer > 0
	{
		vsp = jumpSpd;
		jumpTimer--;
	}
	
	if inWater
	{
		vsp /= 3;
		grv = grvWater;
	} else {
		grv = grvGround;
	}
	
	Player_Collision();
	
	if kDown && onGround
	{
		state = Player_StateRoll;
		moveDistRemain = distRoll;
	}
	
	if kActivate
	{
		var	_activateX = lengthdir_x(10, inputDir);
		var	_activateY = lengthdir_y(10, inputDir);
		activate = instance_position(x + _activateX, y + _activateY, pEntity)
		
		if activate != noone && activate.entityActivateArgs != 1
		{
			ExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			if activate.entityNPC
			{				
				with activate
				{
					direction = point_direction(x,y,other.x,other.y);
				}
			}
		}
	}
	
	if inputMag != 0
	{
		image_xscale = kRight - kLeft;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	
	Player_Shoot()
}