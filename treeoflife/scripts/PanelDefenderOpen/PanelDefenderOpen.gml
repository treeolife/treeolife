function PanelDefenderOpen(){
	if (debugger_mode) show_debug_message("Open defender panel");
	
	var key_quit = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Z"));
	var key_enter = keyboard_check_pressed(vk_enter);
	
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