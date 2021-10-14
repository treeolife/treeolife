/// @description ui

var options = global.options;

var border	= 10;
var width	= ds_list_size(options) * (32 + border * 2) + border * 2;
var height	= 32 + border * 2;

var GUI_X = (window_get_width()/2 - width/2)
var GUI_Y = (window_get_height()/2 - height/2)

if (showGUI) {
	_xx = GUI_X;
	draw_sprite_stretched(sBox, 0, GUI_X, GUI_Y, width, height);
	for (var opt = 0; opt < ds_list_size(options); opt++) {
		
		var selection_pos = selection;
		draw_sprite(sGUI, 0, GUI_X + border + selection_pos * (32 + border*2) + border * 2 + 16 - 28, GUI_Y + 16 + border - 16);
		
		draw_sprite(ds_list_find_value(options, opt), 0, _xx + 16 + border * 2, GUI_Y + 16 + border);
		_xx += 32 + border * 2;
		
	}
}
