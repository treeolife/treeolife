/// @description 

// Inherit the parent event
event_inherited();

if (draw && hasDefender()) {
	draw = false;
	defenderId.draw = true;
} else {
	if (hasDefender()) {
		defenderId.draw = false;
	}
}