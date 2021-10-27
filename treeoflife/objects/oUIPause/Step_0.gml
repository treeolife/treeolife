/// @description user input

var options_size = ds_list_size(global.options);

keyUp		= keyboard_check_pressed(vk_up);
keyDown		= keyboard_check_pressed(vk_down);
keyActivate = keyboard_check_pressed(vk_space) ||
				keyboard_check_pressed(vk_enter);

if (global.gamePaused) {
	pauseOptionSelected += (keyDown - keyUp);

	// Wrap around
	if (pauseOptionSelected >= array_length(pauseOption))
		pauseOptionSelected = 0;
	if (pauseOptionSelected < 0)
		pauseOptionSelected = array_length(pauseOption) -1;
	
	if (keyActivate) {
		switch (pauseOptionSelected) {
		
			default:
		
			case PAUSE.continue_game: {
					global.gamePaused = false;
					oUIPause.hide();
			}
			break;
		
			case PAUSE.help: {
			}
			break;
		
			case PAUSE.sound: {
			}
			break;
		
			case PAUSE.exit_game: {
				if debugger_mode {
					show_debug_message("PAUSE.exit_game");
				}
				room_goto(rStart);
			}
			break;
		}
	}
}
