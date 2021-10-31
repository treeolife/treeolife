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
					checkHelpMenu();
					oUIPause.hide();
			}
			break;
		
			case PAUSE.help: {
				if(!instance_exists(oUIPanelMiddle)) NewPanelMiddle(sSignpost, "Help", "1. Use arrow keys to move.\n2. Jump with space bar.\n3. Enter to select, Esc to escape menu.\n4. Interact with items with \"Z\".");
				else instance_destroy(oUIPanelMiddle);
			}
			break;
		
			case PAUSE.sound: {
			}
			break;
		
			case PAUSE.exit_game: {
				global.gamePaused = false;
				checkHelpMenu();
				if debugger_mode {
					show_debug_message("PAUSE.exit_game");
				}
				TransitionRoom(rStart, "...");
			}
			break;
		}
	}
}

function checkHelpMenu() {
	if(instance_exists(oUIPanelMiddle))
		instance_destroy(oUIPanelMiddle);
}
