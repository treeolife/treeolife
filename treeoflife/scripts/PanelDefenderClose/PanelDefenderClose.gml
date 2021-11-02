/// @function name([pName]);
/// @param {type} pName OPTIONAL! pDescription
function PanelDefenderClose(){
	if (debugger_mode) show_debug_message("Close defender panel");

	if(x < window_get_width() + 50) {
		xFactor = (window_get_width() + 50 - x) / (room_speed / 16)
		x += xFactor;
		title.x += xFactor;
		
		if(buttonsDrawn) {
			buyButton.x += xFactor;
			closeButton.x += xFactor;
		}
	} 
	
	if (x > window_get_width()) {

		if (instance_exists(oButton)) {
			with (oButton) {
				instance_destroy();	
			}
		}
		instance_destroy();	
	}
	
	if (instance_exists(oPlayer)) {
		// disable panel
		// global.panel = false;
		with (oPlayer) state = lastState;
	}

}