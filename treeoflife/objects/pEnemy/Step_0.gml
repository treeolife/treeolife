/// @description check path
	
//var distanceToDefender = 0;
		
//if (instance_exists(oDefenderArea)) {
//	distanceToDefender = point_distance(x, y, oDefenderArea.x, oDefenderArea.y);
			
//	if (distanceToDefender < tileDistance.five)
//		state = pollutionState.aggro;
//	else
//	state = pollutionState.aggroTree;
//}

// Update location each step to determine if moving
old_x = x;
old_y = y;

// Update health bar
healthBar.update(x, y, hp, hp_max, flash, false);

// Follow the path if path exists
path = path_exists(path_building);
if path {
    scr_follow_the_path(path_building);
}


// Apply gravity
if !place_meeting (x, y+1, oCollision) {
        speed_v += game_gravity ;
}

// Check if there is a collsiion
scr_collision();

// on death
//if hp <= 0 {
//	instance_destroy(healthBar);
//	instance_destroy();
//}
