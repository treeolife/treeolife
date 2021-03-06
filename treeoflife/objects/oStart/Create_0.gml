/// @desc GUI setup

enum menu_options {
	new_game	= 5,
	start_game	= 4,
	help		= 3,
	graphics	= 2,
	quit		= 1,
	credits		= 0,
}

gui_width	= display_get_gui_width();
gui_height	= display_get_gui_height();
gui_margin	= 32;

title			= "Tree of Life";
title_font		= fTitle;
title_txt_offset= 4;

help_text		= "Press 'H' for help";
control_text	= "Use up, down keys, and ENTER to select";
menu_x			= gui_width/2;
menu_y			= gui_height;
menu_y_target	= gui_height - gui_margin;
menu_speed		= 25; // lower is faster
menu_font		= fStart;
menu_help_font	= fDebug;
menu_itemheight = font_get_size(menu_font);
menu_help_itemheight = font_get_size(menu_help_font);
menu_committed	= -1;
menu_control	= true;
menu_txt_offset	= 2;
menu_fade		= 0;

if (global.gameStarted == -1 || global.wave == 5) {
	menu[menu_options.start_game]	= "Play";
} else if (global.wave < 5) {
	menu[menu_options.start_game]	= "Continue";
	menu[menu_options.new_game]		= "New Game";
}

menu[menu_options.help]			= "How to Play";
menu[menu_options.graphics]		= "Graphics";
menu[menu_options.credits]		= "Credits";
menu[menu_options.quit]			= "Quit";

menu_items = array_length(menu);

//menu_top = menu_y - ((menu_itemheight * 2.5) * menu_items);

menu_cursor = menu_options.start_game;

if (global.levelAccessed.start == -1) {
	global.levelAccessed.start = 1;
	instance_create_depth(0,0,get_layer_depth(LAYER.ui),fadeIn);
}