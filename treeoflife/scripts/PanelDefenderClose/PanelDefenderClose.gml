/// @function name([pName]);
/// @param {type} pName OPTIONAL! pDescription
function PanelDefenderClose(){
	if (debugger_mode) show_debug_message("Close defender panel");
	
	instance_destroy();
	if (instance_exists(oPlayer)) {
		// disable panel
		// global.panel = false;
		with (oPlayer) state = lastState;
	}
	
	if (instance_exists(oButton)) {
		with (oButton) {
			instance_destroy();	
		}
	}
}