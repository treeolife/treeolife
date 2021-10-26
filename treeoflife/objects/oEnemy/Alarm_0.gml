/// @description targeting

if (tar != noone) {
	if seedlingArray[global.wave] != noone && action == 0 {
		tar = seedlingArray[global.wave];
		target(tar);
	}

	// stuck; re-targetting due to timeout of edge case bad pathing
	if (x == old_x && y == old_y && seedlingArray[global.wave] != noone) {
		tar = seedlingArray[global.wave];
		target(tar);	
	}
}
	
alarm[0] = 2 * 15;