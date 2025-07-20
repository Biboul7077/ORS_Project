//Set Moving Variable
image_speed	=	0;
hsp			=	0;
vsp			=	0;
	grvGround	= 0.4;
	grvWater	= 0.6;
grv = grvGround;
spdWalk		=	3.0;

//Set State Roll
spdRoll		=	5.0;
distRoll	=	96;
moveDistRemain	=	0;

//Set Jump
jumpSpd		=	-4.0;
jumpMax		=	1;
jumpCount	=	0;
jumpHoldFrames	=	17;
jumpTimer	=	0;

//Set State Bonk
bonkDist	=	96;
bonkHeight	=	32;
bonkSpd		=	8;

//Set Sprite, Animation and Particles
spriteRun	=	sPlayer_Run;
spriteIdle	=	sPlayer_Idle;
spriteHurt	=	sPlayer_Hurt;
spriteRoll	=	sPlayer_Roll;

timerDust	=	5;

hascontrol	=	true;

invincible	=	120;
flashAlpha	=	0;
flashColor	=	0;

//Set State Machine
state		=	Player_StateFree;
lastState	=	state;

//Get Player Input
kLeft		=	keyboard_check(ord("Q"));
kRight		=	keyboard_check(ord("D"));
kDown		=	keyboard_check_pressed(ord("S"));

kJump		=	keyboard_check_pressed(ord("Z"));
kHoldJump	=	keyboard_check(ord("Z"));
kDash		=	keyboard_check_pressed(vk_shift);
kActivate	=	keyboard_check_pressed(vk_space);

inputDir	=	point_direction(0,0,kRight-kLeft,0);
inputMag	=	(kRight - kLeft) != 0;
onGround	=	place_meeting(x ,y + 1, oCol)