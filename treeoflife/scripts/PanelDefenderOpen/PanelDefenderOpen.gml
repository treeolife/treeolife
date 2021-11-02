/// @function name([pName]);
/// @param {type} pName OPTIONAL! pDescription
function PanelDefenderOpen(){
	if (debugger_mode) show_debug_message("Open defender panel");
	
	var key_quit = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Z"));
	var key_enter = keyboard_check_pressed(vk_enter);
	
	
	if(key_quit)
		state = PanelDefenderClose;
	
	with (oPlayer) {
		if (state != PlayerStateLocked) {
			
			lastState = state;
			state = PlayerStateLocked;
		}
	}
	
	if (!buttonsDrawn) {
		closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui), oButton);
		with(closeButton) {
			x = other.x;
			y = other.y;
			width = other.width;
			draw = true;
			message = "Close";
		}
		buttonsDrawn = true;
	}
	
}