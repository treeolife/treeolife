/// @description user input

var options_size = ds_list_size(global.options);

keyUp		= keyboard_check_pressed(vk_up);
keyDown		= keyboard_check_pressed(vk_down);
keyActivate = keyboard_check_pressed(vk_space) ||
				keyboard_check_pressed(vk_enter);

if (global.gamePaused) {
	
	if(global.graphicsSettings == graphics.low)
		pauseOption[PAUSE.graphics] = "Graphics: Low";
	else if(global.graphicsSettings == graphics.high)
		pauseOption[PAUSE.graphics] = "Graphics: High";
	
	pauseOptionSelected += (keyDown - keyUp);

	// Wrap around
	if (pauseOptionSelected >= array_length(pauseOption))
		pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) {
		pauseOptionSelected = array_length(pauseOption) -1;
	}
	
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
				if(!instance_exists(oUIPanelMiddle)) 
					NewPanelMiddle(
						global.helpIcon, 
						global.helpTitle, 
						global.helpInfo,
						150);
				else instance_destroy(oUIPanelMiddle);
			}
			break;
		
			case PAUSE.graphics: {
				if(global.graphicsSettings == graphics.low) {
					global.graphicsSettings = graphics.high;
				}
				else
				if(global.graphicsSettings == graphics.high) {
					global.graphicsSettings = graphics.low;
				}
					
			}
			break;
		
			case PAUSE.exit_game: {
				global.gamePaused = false;
				checkHelpMenu();
				if debugger_mode {
					show_debug_message("PAUSE.exit_game");
				}
				TransitionRoom(rStart, global.loadingGeneric);
			}
			break;
		}
	}
}