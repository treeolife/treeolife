/// @description 

// Inherit the parent event
event_inherited();

// do once, after create
if (x == 0) {
	x = window_get_width() / 2;
	image_yscale = height / sprite_height;
	image_xscale = width / sprite_width;
}

show_debug_message("oUIPanelHighlight x : " + string(x));

if (animate) {
	if justCreated {
		justCreated = false;
		if (global.panelState.highlight == -1) {
			global.panelState.highlight = 0;
		}
		global.panelState.highlight += 1;
		image_alpha = 0;
	}
	var seconds = timer / room_speed;
	
	y = yTarget;
	if (seconds > 1.5 && seconds <= secondsToFade && image_alpha <= 1) {
		image_alpha += (0.6 + image_alpha) / room_speed;
	}
	
	//if (y < yTarget && seconds <= 5) {
	//	image_alpha = y/yTarget;
	//	y+= (yTarget - y) / menuSpeed;
	//}
	
	if (seconds > secondsToFade) {
		image_alpha -= (0.8 + image_alpha) / room_speed;
		highlight = false;
		
		if (image_alpha <= 0) {
			instance_destroy();
		}
	}
	timer++;
}