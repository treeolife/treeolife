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

if (menu_control) {	
	
	if (keyboard_check_pressed(vk_up)) {
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down)) {
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		
		scr_play_audio(snd_enter_key, 50, false);
		
		menu_y_target	= gui_height + 200;
		menu_committed	= menu_cursor;
		menu_control	= false;
	}
}

if (menu_y > gui_height + 150) && (menu_committed != -1) {
	switch (menu_committed) {
		case credits_options.back:
			room_goto(rStart);
			break;
		default:
			break;
	}
}