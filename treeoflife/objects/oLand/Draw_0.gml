/// @description 

// Inherit the parent event
event_inherited();

draw_set_color(c_red);
draw_rectangle(
	bbox_left,
	bbox_top,
	bbox_right,
	bbox_bottom,
	1);
draw_set_color(c_white);

if debugger_mode
	scr_draw_set(image_alpha, c_white, function() {
		scr_set_align(fa_left, fa_bottom);
		draw_set_font(fSmall);
		truestate_draw_current(x+20, y+20);
		draw_text(x+20, y+30,"hp: " + string(hp));
	})

truestate_draw();