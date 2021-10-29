/// @description 

y = y + sin(timer*frequency) * amplitude;

timer++;

// alpha
sineWave = 0 + (1 + sin(2*pi*current_time/1000 * 0.30)) * 0.8 // 0 - 0.8

if(interactOrigin == noone || interactX == -1) exit;

var distanceX = floor(abs(xstart - interactX));
var distanceLeft = floor(abs(x - interactX));
var time = pickedTime / room_speed;
var percent = ((distanceX - distanceLeft) / distanceX);

if(time > .4)
	image_alpha = 1 - time;

if (percent >= 0.8) {

	visible = false;
	x = 0;
	y = 0; 
}

// Sine trajectory
y = ystart - sin(percent * pi) * 24;
// consider item on left
if (x - interactX < 0) {
	x += 1; 
} else {
// consider item on right
	x -= 1;
}
