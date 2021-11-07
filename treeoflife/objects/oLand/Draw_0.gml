/// @description oLand

// Inherit the parent event
event_inherited();

if debugger_mode {
	draw_set_color(c_red);
	draw_rectangle(
		bbox_left,
		bbox_top,
		bbox_right,
		bbox_bottom,
		1);
	scr_draw_set(image_alpha, c_white, function() {
		scr_set_align(fa_left, fa_bottom);
		draw_set_font(fSmall);
		truestate_draw_current(x+20, y+20);
		draw_text(x+20, y+30,"hp: " + string(hp));
		
		var target;
		if currentTarget != noone && instance_exists(currentTarget)
			target = object_get_name(currentTarget.object_index);
		else
			target = "noone"
		draw_text(x+20,y+40,"target: " + string(target));
	})
}

truestate_draw();