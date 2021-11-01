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
		if (menu_cursor == menu_options.new_game) {
			instance_create_depth(0,0,get_layer_depth(LAYER.ui),fadeOut);
		}
		
		// exclude Help menu option
		if (menu_cursor != menu_options.help) {
			menu_y_target	= gui_height + 200;
			menu_committed	= menu_cursor;
			menu_control	= false;
		} else {
			// Help menu option chosen
			if(!instance_exists(oUIPanelMiddle)) 
				NewPanelMiddle(
					global.howToPlayIcon,
					global.howToPlayTitle, 
					global.howToPlayInfo);
			
			else instance_destroy(oUIPanelMiddle);
		}
	}
}

if (menu_y > gui_height + 150) && (menu_committed != -1) {
	
	switch (menu_committed) {
		
		case menu_options.start_game:

			if (global.gameStarted == -1) {
				TransitionRoom(rExposition1, global.loadingGeneric);
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