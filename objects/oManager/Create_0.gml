/// GLOBAL STATS
global.gamePaused	= false;
global.gameSaveSlot	= 0;
global.iCamera	= instance_create_layer(0,0,layer,oCam);

//Room Transition
global.targetRoom	= -1;
global.targetX		= 192;
global.targetY		= 256;
global.targetDir	= 1;

//Textbox
global.textSpd	= .75;
global.fntTextboxes = font_add("President Evil.ttf", 12, false, false, 32, 128);

//Waves Variable
global.u_pixelH_Wave = shader_get_uniform(shWave,"pixelH");
global.u_pixelW_Wave = shader_get_uniform(shWave,"pixelW");
global.u_springCount = shader_get_uniform(shWave,"springCount");
global.u_springs = shader_get_uniform(shWave,"pixelsprings");
global.u_time = shader_get_uniform(shWave,"time");

//Player Stats
global.ammo		= 4;
global.color	= c_red;
global.coin		= 0;
global.dmg		= 5;
global.hp		= 4;

//Respawn
global.savespot	= noone;

randomize();
room_goto(ROOM_START);
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
audio_play_sound(Main_Title__ORS, SOUND_PRIORITY.MUSIC, true);