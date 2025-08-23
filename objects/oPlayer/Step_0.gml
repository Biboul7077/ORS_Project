//Update Player Input
kLeft		=	keyboard_check(ord("Q"));
kRight		=	keyboard_check(ord("D"));
kDown		=	keyboard_check_pressed(ord("S"));

kJump		=	keyboard_check_pressed(ord("Z"));
kHoldJump	=	keyboard_check(ord("Z"));
kDash		=	keyboard_check_pressed(vk_shift);
kActivate	=	keyboard_check_pressed(vk_space);

//Movement
onGround	= place_meeting(x ,y + 1, oCol);
inWater		= place_meeting(x, y, oWater);
if !global.gamePaused
{
	script_execute(state);
	invincible = max(invincible - 1, 0);
}

///ANIMATION & PARTICLES

if inputMag != 0 && onGround && xprevious != x
{
	timerDust -= 1;
}

if timerDust <= 0
{
	timerDust = inWater ? 20 : 5;
	var _spriteDust = inWater ? sBubbles : sDust;
	repeat(irandom_range(1,3)) {
		with instance_create_depth(x - (image_xscale * 10), y + 12, depth + 1, oParticles) {
			sprite_index	=	_spriteDust
			image_angle		=	random(360)
			fric			=	0.8;
			motion_add(random_range(70,-70), -other.image_xscale * random_range(4, 9));
		}
	}
}

///HP MANAGEMENT
var _dHP = inWater ? 0.05 : 0.0005;
global.hp += _dHP;
global.hp = min(global.hp, 6);