/// @desc Control Menu
menu_y += (menu_y_target - menu_y) / menu_speed;

// Fade in
if menu_committed == -1 {	
	if (menu_fade > 1) menu_fade = 1;
	else menu_fade += 0.05;
} else {
	// Fade out
	menu_fade -= 0.05;
}

function checkHelpMenu() {
	if(instance_exists(oUIPanelMiddle))
		instance_destroy(oUIPanelMiddle);
}
	
if(global.graphicsSettings == graphics.low)
	menu[menu_options.graphics] = "Graphics: Low";
else if(global.graphicsSettings == graphics.high)
	menu[menu_options.graphics] = "Graphics: High";
	
	

if (menu_control) {	
	if (keyboard_check_pressed(vk_up)) {
		checkHelpMenu();
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(vk_down)) {
		checkHelpMenu();
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if (keyboard_check_pressed(vk_enter)) {
		
		scr_play_audio(snd_enter_key, 50, false);
		
		if (menu_cursor == menu_options.new_game) {
			instance_create_depth(0,0,get_layer_depth(LAYER.ui),fadeOut);
		}
		
		// Exclude Help and Graphics menu - they are toggles
		if (menu_cursor != menu_options.help && menu_cursor != menu_options.graphics) {
			menu_y_target	= gui_height + 200;
			menu_committed	= menu_cursor;
			menu_control	= false;
		} else {
			// Help menu option chosen
			if (menu_cursor == menu_options.help)
				if(!instance_exists(oUIPanelMiddle)) {
					help = NewPanelMiddle(
						global.howToPlayIcon,
						global.howToPlayTitle, 
						global.howToPlayInfo,
						330);
					help.y = 150;
			
				} else instance_destroy(oUIPanelMiddle);
				
			if (menu_cursor == menu_options.graphics) {
					
				if(global.graphicsSettings == graphics.low) {
					global.graphicsSettings = graphics.high;
				}
				else
				if(global.graphicsSettings == graphics.high) {
					global.graphicsSettings = graphics.low;
				}
				
			}
		}
	}
}

if (menu_y > gui_height + 150) && (menu_committed != -1) {
	
	switch (menu_committed) {
		
		case menu_options.start_game:

			if (global.wave == 5)
				game_restart();

			if (global.gameStarted == -1) {
				TransitionRoom(ROOM_START, global.loadingGeneric);
			} else {
				TransitionRoom(oController.getLevelRoom(), global.loadingInfo);
			}
			break;
		default:
			break;
			
		case menu_options.new_game:
			game_restart();
			break;
			
		case menu_options.credits:
		
			room_goto(rCredits);
			break;
			
		case menu_options.quit:
		
			game_end();
			break;
	}
}