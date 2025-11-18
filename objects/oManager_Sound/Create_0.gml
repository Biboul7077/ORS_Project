/// SOUND_MASTER_VARIABLES
max_distance_to_be_heard	=	150;
start_dropping_off_at		=	75;
multiplier					=	5;

audio_falloff_set_model(audio_falloff_exponent_distance);

//Music
syncgroup_Landfill = audio_create_sync_group(true);

	audio_play_in_sync_group(syncgroup_Landfill, The_Landfill___ORS___Layer1_Ambient);
	audio_play_in_sync_group(syncgroup_Landfill, The_Landfill___ORS___Layer2_Exploration);
	audio_play_in_sync_group(syncgroup_Landfill, The_Landfill___ORS___Layer3_Tension);
	audio_play_in_sync_group(syncgroup_Landfill, The_Landfill___ORS___Layer4_Fight);
	audio_play_in_sync_group(syncgroup_Landfill, The_Landfill___ORS___Layer5_SafeZone);
	
	audio_sound_gain(The_Landfill___ORS___Layer2_Exploration, 0);
	audio_sound_gain(The_Landfill___ORS___Layer3_Tension, 0);
	audio_sound_gain(The_Landfill___ORS___Layer4_Fight, 0);
	audio_sound_gain(The_Landfill___ORS___Layer5_SafeZone, 0);
	
audio_start_sync_group(syncgroup_Landfill);