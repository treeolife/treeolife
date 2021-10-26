/// @description ui

var options = global.options;

var border	= 10;
var width	= ds_list_size(options) * (32 + border * 2) + border * 2;
var height	= 102 + border * 2;

global.GUI_X = (window_get_width()/2 - width/2);
global.GUI_Y = (window_get_height()/2 - height/2 + 100);

GUI_X = global.GUI_X;
GUI_Y = global.GUI_Y;

_xx = GUI_X;
//show_debug_message("drawing at" + string(GUI_X) + " " + string(GUI_Y));
draw_sprite_stretched(sBox, 0, GUI_X, GUI_Y, width, height);
for (var opt = 0; opt < ds_list_size(options); opt++) {
		
	var selection_pos = selection;
	draw_sprite(sGUI, 0, 
		GUI_X + border + selection_pos * (32 + border*2) + border * 2 + 16 - 28, 
		GUI_Y + 16 + border - 16);
		
	draw_sprite(ds_list_find_value(options, opt), 0, 
		_xx + 16 + border * 2, 
		GUI_Y + 16 + border);
			
	_xx += 32 + border * 2;
		
}
	
scr_draw_set(1, c_white, function() {
	scr_set_align(fa_left, fa_middle);
	draw_set_font(fKey);
	draw_set_color(col_msg);
	draw_text_ext_transformed(global.GUI_X + 10, global.GUI_Y + 32 + 8, "-" + string(defender_cost) + " water", 0, 400,1,1,0);
});
