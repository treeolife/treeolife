/// @description 

timer++;

// alpha
sineWave = 0 + (1 + sin(2*pi*current_time/1000 * 0.30)) * 0.8 // 0 - 0.8

if(interactOrigin == noone || interactX == -1) exit;

var distanceX = floor(abs(xstart - interactX));
var distanceLeft = floor(abs(x - interactX));
var time = pickedTime / room_speed;
var percent = ((distanceX - distanceLeft) / distanceX);

//if(time > .4)
//	image_alpha = 1 - time;

if (!picked) {
	y = y + sin(timer*frequency) * amplitude;
	x = floor(x);
} else {
		image_alpha -= (1 + image_alpha) / room_speed;
	
		if (image_alpha < 0.2 || sin(time * 2 * pi) < 0) { 
			visible = false;
			x = 0;
			y = 0;
		}
	
		// Sine trajectory
		//if (distanceX > 2) {
	
		//	y = floor(ystart - sin(percent * pi) * 24);
		//} else {
			y = floor(ystart - sin(time * 2 * pi) * 24);
		//}

		// consider item on left
		if (x - interactX < 0) {
			if debugger_mode show_debug_message("item on left . " 
								+ "time: " + string(time) 
								+ " . percent: " + string(percent)
								+ " . distanceX: " + string(distanceX));
			x += ceil(time); 
		} else {
		// consider item on right
			if debugger_mode show_debug_message("item on right . " 
								+ "time: " + string(time) 
								+ " . percent: " + string(percent)
								+ " . distanceX: " + string(distanceX));
			x -= ceil(time);
		}
}