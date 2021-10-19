/// @description check path

// Update health bar
healthBar.update(x, y, hp, hp_max, flash, false);

// Follow the path if path exists
if path_exists(path_building)
{
    scr_follow_the_path(path_building);
}


// Apply gravity
if !place_meeting (x, y+1, oCollision)
    {
        speed_v += game_gravity ;
    }

// Check if there is a collsiion
scr_collision();