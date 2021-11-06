/// @description draw path

draw_self();

// Draw the grid
if ds_exists(ds_gridpathfinding,ds_type_grid) {
	if (debugger_mode) && draw_grids_debug
	    for (var i=0; i<ds_grid_width(ds_gridpathfinding); i+=1)
	    {
	        for (var j=0; j<ds_grid_height(ds_gridpathfinding); j+=1)
	        {
	            var value = ds_grid_get(ds_gridpathfinding,i,j);
            
	            draw_text_transformed(i*oGrid.cell_width + 8, j*oGrid.cell_height + 8,string(value), 1, 1,0);
	        }
	    }
}

/// Draw the path
if path_exists(path_building)
{
	if (debugger_mode) && draw_path_debug
		draw_path(path_building,floor(x/oGrid.cell_width), floor(y/oGrid.cell_height),true) ;
}

/// Draw debug status
if (debugger_mode) {
	scr_draw_set(image_alpha, c_white, function() {
		scr_set_align(fa_left, fa_bottom);
		draw_set_font(fSmall);
		draw_text(x+20,y,"attacked: " + string(attacked));
		draw_text(x+20,y+10,"attackedBy: " + string(attackedBy));
		if (state != -1)
			draw_text(x+20,y+20,"state: " + state.stateName);
	})
}