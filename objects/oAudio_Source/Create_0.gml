idSound = audio_play_sound_at(
	sound,
	x, y, 0,
	oManager.max_distance_to_be_heard,
	oManager.start_dropping_off_at,
	oManager.multiplier,
	true, ALARM_PRIORITY);