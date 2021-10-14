/// @description initialise
/// Initialize the color
draw_set_color (c_black) ;

/// initialize variables in order to draw grid and the path
ds_gridpathfinding = noone ;
path_building = noone ;

/// Initialize variables for enemy movement
max_speed = 4;
game_gravity = 1;
jump_height = -10;
speed_v = 0 ;
speed_h = 0 ;

/// Intialialize variables for follow the path
action = 0 ;
path_point = 0 ;
jump_action = 0 ;