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

//Player Stats
global.ammo		= 4;
global.color	= c_red;
global.dmg		= 5;
global.hp		= 4;

global.currencyTotal	= 0;
global.currencyBuffer	= 0;
global.currencyTimer	= 0;

//Respawn
global.savespot	= noone;

randomize();
room_goto(ROOM_START);
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
audio_play_sound(Main_Title__ORS, SOUND_PRIORITY.MUSIC, true);