/// SOUND_MASTER_VARIABLES
max_distance_to_be_heard	=	150;
start_dropping_off_at		=	75;
multiplier					=	5;

audio_falloff_set_model(audio_falloff_exponent_distance);

audio_play_sound(The_Landfill___ORS___Layer1_Ambient,0,true);

/// HUD
Fnt_Name	= font_add("President Evil.ttf", 12, false, false, 32, 128);

healthbar_x = 86;
healthbar_y = 32;
healthbar_h = 14;
healthbar_w = 70;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

/// GLOBAL STATS
global.gamePaused	= false;
global.iCamera	= instance_create_layer(0,0,layer,oCam);
global.textSpd	= .75;

global.u_pixelH_Wave = shader_get_uniform(shWave,"pixelH");
global.u_pixelW_Wave = shader_get_uniform(shWave,"pixelW");
global.u_springCount = shader_get_uniform(shWave,"springCount");
global.u_springs = shader_get_uniform(shWave,"pixelsprings");
global.u_time = shader_get_uniform(shWave,"time");

global.ammo		= 4;
global.color	= c_red;
global.coin		= 0;
global.dmg		= 5;
global.hp		= 4;

/// FONT
global.fntTextboxes = font_add("President Evil.ttf", 12, false, false, 32, 128);

randomize();
room_goto(ROOM_START);