/// @description ui

var options = global.options;

var border	= 10;
var width	= ds_list_size(options) * (32 + border * 2) 
				+ border * 2;
var height	= 102 + border * 2;

global.pauseGUI_X = window_get_width();
global.pauseGUI_Y = window_get_height();

pauseGUI_X = global.pauseGUI_X;
pauseGUI_Y = global.pauseGUI_Y;

pauseMenuFont = fKey;

_xx = pauseGUI_X;

// Grey out
draw_sprite_stretched(sCollision, 
	0, 0, 0, pauseGUI_X, pauseGUI_Y);
	
scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(pauseMenuFont);
	draw_set_color(col_msg);
	draw_set_alpha(1.0);
	
	draw_text_ext_transformed(
		pauseGUI_X/2, 
		pauseGUI_Y/2, "Paused", 0, 400, 1, 1,0);
		
	// Options
	for (var i = 0; i < array_length(pauseOption); i++) {
		
		var _print = "";
		if (i == pauseOptionSelected) {
			
			_print += "> " + pauseOption[i] + " <";
		} else {
			
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(pauseGUI_X * 0.5, pauseGUI_Y * 0.5
			+ font_get_size(pauseMenuFont) * (i + 2),
			_print);
			
		draw_set_alpha(1.0);
	}
});