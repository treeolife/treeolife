/// @description behaviour

if (tar != noone) {
	// target seedling if not attacked
	if !attacked && 
	seedlingArray[global.wave] != noone && action == 0 {
		tar = seedlingArray[global.wave];
		target(tar);
	} 

	// attack defenders if pollution is being attacked
	if (attacked) {
		//if attackedBy != noone
			target(attackedBy);
	} else if (seedlingArray[global.wave] != noone) {
		target(seedlingArray[global.wave]);
	}

	// re-targetting due to timeout of edge case bad pathing
	if (x == old_x && y == old_y && 
	seedlingArray[global.wave] != noone) {
		tar = seedlingArray[global.wave];
		target(tar);	
	}
}
	
alarm[0] = 2 * 15;