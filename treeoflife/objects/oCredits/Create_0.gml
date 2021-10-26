/// @desc GUI setup

enum credits_options
{
	back = 0,
}

enum credits
{
	draw_art_1 = 3,
	break_things = 2,
	draw_art_2 = 1,
	write_code = 0,
}

gui_width	= display_get_gui_width();
gui_height	= display_get_gui_height();
gui_margin	= 32;

title			= "Credits";
help_text		= "Press 'h' for help";
control_text	= "Use up, down keys, and ENTER to select";
menu_x			= gui_margin * 2;
menu_y			= 0;
menu_y_target	= 30;
menu_speed		= 25; // lower is faster
menu_font		= fStart;
menu_help_font	= fDebug;
menu_itemheight = font_get_size(menu_font);
menu_committed	= -1;
menu_control	= true;
menu_txt_offset	= 2;
menu_fade		= 0;

menu[credits_options.back]	= "Back";

menu_items = array_length(menu);

menu_cursor = credits_options.back;

roles_menu[credits.draw_art_1] = "Producer, Artist";
roles_menu[credits.break_things] = "QA, Levels";
roles_menu[credits.draw_art_2] = "Artist";
roles_menu[credits.write_code] = "Code";

roles_menu_items = array_length(roles_menu);

credits_menu[credits.draw_art_1] = "Felisha";
credits_menu[credits.break_things] = "Yu Ling";
credits_menu[credits.draw_art_2] = "Pei Chih";
credits_menu[credits.write_code] = "Hansel";

credits_menu_items = array_length(credits_menu);