/// @desc GUI setup

enum credits_options {
	back = 0,
}

enum credits {
	draw_art_1		= 18,
	break_things	= 17,
	draw_art_2		= 16,
	write_code		= 15,
	empty_space_5	= 14,
	empty_space_4	= 13,
	empty_space_3	= 12,
	empty_space_2	= 11,
	empty_space		= 10,
	sound_fx_2		= 9,
	shaun			= 8,
	sound_fx_1		= 7,
	portal_art		= 6,
	particles_art	= 5,
	background_3	= 4,
	background_2	= 3,
	font_credit		= 2,
	background_1	= 1,
	music_credit	= 0,
}

gui_width	= display_get_gui_width();
gui_height	= display_get_gui_height();
gui_margin	= 32;

title			= "Credits";
title_font		= fCredits;
title_txt_offset= 3;

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

menu[credits_options.back]	= "To Main Menu";

menu_items = array_length(menu);

menu_cursor = credits_options.back;

roles_menu[credits.empty_space_5] = "";
roles_menu[credits.empty_space_4] = "";
roles_menu[credits.empty_space_3] = "";
roles_menu[credits.empty_space_2] = "";
roles_menu[credits.empty_space] = "";
roles_menu[credits.sound_fx_2] = "Sound effects";
roles_menu[credits.shaun] = "Textboxes";
roles_menu[credits.sound_fx_1] = "Sound effects";
roles_menu[credits.portal_art] = "Portal art";
roles_menu[credits.particles_art] = "Weather particles";
roles_menu[credits.background_3] = "Main menu background";
roles_menu[credits.background_2] = "Landfill background";
roles_menu[credits.font_credit] = "Fonts, m3x6 m5x7";
roles_menu[credits.background_1] = "Forest background";
roles_menu[credits.music_credit] = "Ultimate Battle BGM";

credits_menu[credits.empty_space_5] = "";
credits_menu[credits.empty_space_4] = "";
credits_menu[credits.empty_space_3] = "";
credits_menu[credits.empty_space_2] = "";
credits_menu[credits.empty_space] = "";
credits_menu[credits.sound_fx_2] = "Feliyanstudios";
credits_menu[credits.shaun] = "Shaun Spalding";
credits_menu[credits.sound_fx_1] = "Zapslat";
credits_menu[credits.portal_art] = "Alexis Bailey";
credits_menu[credits.particles_art] = "1up Indie";
credits_menu[credits.background_3] = "Merrigo";
credits_menu[credits.background_2] = "Liz Ablashi";
credits_menu[credits.font_credit] = "Daniel Linssen";
credits_menu[credits.background_1] = "Noirlac";
credits_menu[credits.music_credit] = "Laura Shigihara";



roles_menu[credits.draw_art_1] = "Producer, Artist";
roles_menu[credits.break_things] = "QA, Levels";
roles_menu[credits.draw_art_2] = "Artist, Story";
roles_menu[credits.write_code] = "Coder, UX";

roles_menu_items = array_length(roles_menu);

credits_menu[credits.draw_art_1] = "Felisha";
credits_menu[credits.break_things] = "Yu Ling";
credits_menu[credits.draw_art_2] = "Pei Chih";
credits_menu[credits.write_code] = "Hansel";

credits_menu_items = array_length(credits_menu);