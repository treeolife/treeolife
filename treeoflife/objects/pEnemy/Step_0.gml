/// @description ts pEnemy check path
	
// If pollution being attacked
// Grant invulnerability for attackableTimer
if (attacked) {
	if (attackableTime > 0) {
		attackable = false;	
	}
}

if (attackableTime > 0)
attackableTime--;

if (attackableTime == 0) { // Make attackable and vulnerable, reset timer
	attackable = true;
	attackableTime = attackableTimeMax;
}

// Update location each step to determine if moving
old_x = x;
old_y = y;

// Update health bar
if (instance_exists(healthBar))
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

truestate_step();