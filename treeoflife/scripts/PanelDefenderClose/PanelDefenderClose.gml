function PanelDefenderClose(){
	if (debugger_mode) show_debug_message("Close defender panel");

	if(x < window_get_width() + 50) {
		xFactor = (window_get_width() + 50 - x) / (room_speed / 16)
		x += xFactor;
		title.x += xFactor;
		
		if(buttonsDrawn) {
			for (var b = 0; b < array_length(buttons); b++) {
				buttons[b].x += xFactor;
			}
		}
	} 
	
	if (x > window_get_width()) {

		if (instance_exists(oButton)) {
			with (oButton) {
				instance_destroy();	
			}
		}
		instance_destroy();	
		action_complete = true;
	}
	
	if (instance_exists(oPlayer)) {
		// disable panel
		// global.panel = false;
		with (oPlayer) state = lastState;
	}

}