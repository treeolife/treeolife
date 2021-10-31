/// @description 

// Inherit the parent event
event_inherited();

if (animate) {
	var seconds = timer / room_speed;
	
	if (y < yTarget && seconds <= 5) {
		image_alpha = y/yTarget;
		y+= floor((yTarget - y) / menuSpeed);
	}
	
	if (seconds > secondsToFade) {
		image_alpha -= (0.5 + image_alpha) / room_speed;
		highlight = false;
		
		if (image_alpha <= 0) {
			instance_destroy();
		}
	}
	timer++;
}