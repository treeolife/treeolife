/// @description behaviour

tar = oTree;

target(oTree);

if (tar != noone) {
	// target seedling if not attacked
	if !attacked && 
	oTree != noone && action == 0 {
		tar = oTree;
		target(tar);
	} 

	// attack defenders if pollution is being attacked
	if (attacked) {
		//if attackedBy != noone
			target(attackedBy);
	} else if (oTree != noone) {
		target(oTree);
	}

	// re-targetting due to timeout of edge case bad pathing
	if (x == old_x && y == old_y && 
	oTree != noone) {
		tar = oTree;
		target(tar);	
	}
}
	
alarm[0] = 2 * room_speed;