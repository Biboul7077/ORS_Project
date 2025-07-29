//Set Moving Variable
image_speed	=	0;
hsp			=	0;
vsp			=	0;
grv			=	0;

// Déplacement horizontal
spdMax = 4.5;
accGround = 1.0;
decGround = 1.2;
accAir = 0.4;
decAir = 0.5;

// Gravité / saut
jumpSpd = -6.5;
jumpCount = 0;
jumpHoldFrames = 5;
jumpMax = 1;

// Suspension au sommet
fallMult = 1.2;
lowJumpMult = 2.0;
jumpTimer = 0;

// Coyote time et jump buffer (optionnel mais conseillé)
coyoteTimeMax = 4;
coyoteTimer = 0;
jumpBufferMax = 6;
jumpBuffer = 0;

// Direction de mouvement
inputMag = 0;
inputDir = 0;

//Set State Roll
spdRoll		=	5.0;
distRoll	=	96;
moveDistRemain	=	0;

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

invincible	=	0;
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
onGround	=	place_meeting(x ,y + 1, oCol);
inWater		=	false;