/// @description 

// Inherit the parent event
event_inherited();

frequency = 0.1;
amplitude = 0.03;

timer = 0;

sineWave = 0;

picked = false;
interactX = -1;
pickedTime = 0;

speed_h = 0;
speed_v = 0;
game_gravity = 0.4;

function onGroundHover(sineWave, gravityCallback) {
	var isOnGround = place_meeting(x, y+floor(sineWave)+3, oCollision);
	if (isOnGround) {
		
		y -= sineWave;
	} else {
		gravityCallback();
	}
	
	return isOnGround;
}