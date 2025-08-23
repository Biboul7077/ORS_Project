if global.gamePaused
{
	keyUp = keyboard_check_pressed(ord("Z"));
	keyDown = keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	if pauseOptionSelected >= array_length(pauseOption) pauseOptionSelected = 0;
	if pauseOptionSelected < 0 pauseOptionSelected = array_length(pauseOption) - 1;
	
	keyActivate = keyboard_check_pressed(vk_space);
	if keyActivate
	{
		switch (pauseOptionSelected) {
		    case PAUSE_OPTION.RESUME:
		        global.gamePaused = false
				with all
				{
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
		        break;
			case PAUSE_OPTION.SETTINGS:
				break;
			case PAUSE_OPTION.MENU:
				SaveGame();
				game_restart();
				break;
			case PAUSE_OPTION.QUIT:
				SaveGame();
				game_end();
				break;
		    default:
		        // code here
		        break;
		}
	}
}