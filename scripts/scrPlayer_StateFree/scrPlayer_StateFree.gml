function Approach(val, target, step) {
	return (val < target) ? min(val + step, target) : max(val - step, target);
}

function Player_StateFree() {

	// === INPUTS ===
	if (kLeft && kRight) {
		inputMag = 0;
	} else {
		inputMag = (kLeft || kRight);
		inputDir = kRight - kLeft;
	}

	// === COYOTE TIME ===
	if (onGround || inWater) {
		coyoteTimer = coyoteTimeMax;
		jumpCount = 0;
	} else {
		coyoteTimer--;
		if (jumpCount == 0) jumpCount = 1;
	}

	// === JUMP BUFFER ===
	if (kJump) {
		jumpBuffer = jumpBufferMax;
	} else {
		jumpBuffer--;
	}

	// === GRAVITÉ SPÉCIFIQUE EAU / SOL ===
	grv = inWater ? WATER_GRAVITY : AIR_GRAVITY;
	
	// === SAUT ===
	if (jumpBuffer > 0 && (coyoteTimer > 0 || jumpCount < jumpMax)) {
		vsp = jumpSpd;
		jumpCount++;
		jumpTimer = jumpHoldFrames;
		jumpBuffer = 0;
	}

	if (jumpTimer > 0 && kHoldJump) {
		jumpTimer--;
	} else {
		if (vsp < 0 && !kHoldJump) {
			vsp += grv * lowJumpMult;
		} else if (vsp > 0) {
			vsp += grv * fallMult;
		} else {
			vsp += grv;
		}
	}

	// === DÉPLACEMENT HORIZONTAL AVEC ACCÉLÉRATION ===
	var acc = onGround ? accGround : accAir;
	var dec = onGround ? decGround : decAir;

	if (inputMag != 0) {
		hsp = Approach(hsp, inputDir * spdMax, acc);
	} else {
		hsp = Approach(hsp, 0, dec);
	}

	// === COLLISIONS ===
	Player_Collision();

	// === ANIMATION ===
	if (inputMag != 0) {
		image_xscale = inputDir;
		sprite_index = spriteRun;
	} else {
		sprite_index = spriteIdle;
	}

	// === TRANSITION ROULADE ===
	if (kDown && onGround) {
		state = Player_StateRoll;
		moveDistRemain = distRoll;
	}

	// === ACTIVATION ===
	if (kActivate) {
		var _activateX = lengthdir_x(10, inputDir);
		var _activateY = lengthdir_y(10, inputDir);
		var activate = instance_position(x + _activateX, y + _activateY, pEntity);

		if (activate != noone && activate.entityActivateScript != -1 && activate.entityActivateArgs != -1) {
			ExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);

			if (activate.entityNPC) {
				with (activate) {
					direction = point_direction(x, y, other.x, other.y);
				}
			}
			
			state = Player_StateLocked;
		}
	}

	// === ATTAQUE ===
	Player_Shoot();
}