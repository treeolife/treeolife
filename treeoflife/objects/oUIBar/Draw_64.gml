/// @description 

draw_self();

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_left, fa_middle);
	draw_set_font(fText);
	draw_text_ext_transformed(16, 8, "Water: " + string(global.water_amount), 0, 400,1,1,0);
});