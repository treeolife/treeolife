/// @description user input

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
	
	if (pauseOptionSelected != PAUSE.help) {
		checkHelpMenu();
	}
	
	if (keyActivate) {
		with(oPlayer) {
			scr_play_audio(snd_enter_key, 50, false);
		}
		
		switch (pauseOptionSelected) {
		
			default:
		
			case PAUSE.continue_game: {
				global.gamePaused = false;
				checkHelpMenu();
				oUIPause.hide();
			}
			break;
		
			case PAUSE.replay: {
				global.roomReplay = true;
				global.gamePaused = false;
				oUIPause.hide();
				with(global.oSnapshot) {
					TransitionRoom(oController.getLevelRoom(), "Replay");
					triggerReplay();
				}
			}
			break;
			
			case PAUSE.help: {
				if(!instance_exists(oUIPanelMiddle)) {
					help = NewPanelMiddle(
						global.helpIcon, 
						global.helpTitle, 
						global.helpInfo,
						150);
					help.y = 230;
				} else instance_destroy(oUIPanelMiddle);
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
				global.roomReplay = true;
				
				checkHelpMenu();
				if debugger_mode {
					show_debug_message("PAUSE.exit_game");
				}
				with(global.oSnapshot) {
					TransitionRoom(rStart, global.loadingGeneric);
					triggerReplay();
				}
			}
			break;
		}
	}
}