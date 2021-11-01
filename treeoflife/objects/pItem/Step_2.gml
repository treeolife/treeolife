/// @description 

// Inherit the parent event
event_inherited();

if (picked) {
	
	draw = false;
	pickedTime++;
} else {
	
	onGroundHover(sineWave, function() {
		scr_collision();
		y += game_gravity;
	})
}

if (!global.gamePaused) {
	depth = -1;
}