/// @description help text

draw_set_color(c_black);
draw_set_font(menu_help_font);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_set_alpha(menu_fade);
draw_text_transformed(
	gui_width - gui_margin * 2,
	gui_margin,
	help_text,1,1,0);
//draw_text_transformed(
//	gui_margin,
//	gui_margin * 2,
//	control_text,1,1,0);

draw_set_alpha(1);