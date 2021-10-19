/// @description initialise

flash = 0;

alarm[0] = 5 * 15;

image_speed = 0;

// Health bar
healthBar = instance_create_depth(x, y, LAYER.enemy, oHealthbar);

/// Initialize the color
draw_set_color (c_black) ;

/// Initialize variables in order to draw grid and the path
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

function target(targ) {
	/// Reset all variable when we build a new path because enemy might be in path when we press S
	speed_h = 0;
	speed_v = 0;
	if path_exists(path_building) {
	    path_delete (path_building);
	}
	path_point = 0 ;
	action = 0 ;
	jump_action = 0 ;

	scr_fill_the_grid(floor(x/oGrid.cell_width), floor(y/oGrid.cell_height), floor(targ.x/oGrid.cell_width), floor(targ.y/oGrid.cell_height));
}