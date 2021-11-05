/// @description targeting

target(oTree);

if (tar != noone) {
	if oTree != noone && action == 0 {
		tar = oTree;
		target(tar);
	}

	// stuck; re-targetting due to timeout of edge case bad pathing
	if (x == old_x && y == old_y && oTree != noone) {
		tar = oTree;
		target(tar);	
	}
}
	