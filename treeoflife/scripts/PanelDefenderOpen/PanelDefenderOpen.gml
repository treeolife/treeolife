function PanelDefenderOpen(){
	if (debugger_mode) show_debug_message("Open defender panel");
	
	var key_quit = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Z"));
	var key_enter = keyboard_check_pressed(vk_enter);
	var key_up = keyboard_check_pressed(vk_up);
	var key_down = keyboard_check_pressed(vk_down);
	var key_change = key_down - key_up;
	
	buttonSelected += (key_change);

	// Wrap around
	if (buttonSelected >= array_length(buttons))
		buttonSelected = 0;
	if (buttonSelected < 0) {
		buttonSelected = array_length(buttons) -1;
	}
	
	// Options
	for (var i = 0; i < array_length(buttons); i++) {
		if (i == buttonSelected) {
			buttons[i].outline = true;
			buttons[i].col_text = c_white;
		} else {
			buttons[i].outline = false;
			buttons[i].col_text = c_maroon;
		}
	}
	
	
	if(key_quit)
		state = PanelDefenderClose;
	
	if(xTarget < x) {
		xFactor = (x - xTarget) / (room_speed / 8)
		x -= xFactor;
		title.x -= xFactor;
		
		if(buttonsDrawn) {
			buyButton.x -= xFactor;
			closeButton.x -= xFactor;
		}
	}
	
	with (oPlayer) {
		if (state != PlayerStateLocked) {
			
			lastState = state;
			state = PlayerStateLocked;
		}
	}
	
	if (!buttonsDrawn) {
		state = PanelDefenderDraw; 
		buttonsDrawn = true;
	}
}