/// @description 

draw_self();

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_left, fa_middle);
	draw_set_font(fText);
	
	/// Background
	draw_sprite_stretched(sCollision, 0, 0, 0, window_get_width(), 60);
	
	/// Timer progress bar
	if(global.currentTime >= 0) draw_sprite_stretched(sDoor, 0, window_get_width() - 200 - 16, 14, 200 * ((global.currentTime) / global.timer) , 40);
	
	/// Wave, Water information
	draw_text_ext_transformed(16, 8, "Wave: " + string(global.wave), 0, 400,1,1,0);
	draw_text_ext_transformed(16, window_get_height() - 60, "Water: " + string(global.water_amount), 0, 400,1,1,0);
	
	scr_set_align(fa_right, fa_middle);
	
	/// Next stage text
	//if(global.currentTime >= 0) draw_text_ext_transformed(window_get_width() - 200 - 16, 8, "Next", 0, 400,1,1,0);
	
	/// Seeds information
	draw_text_ext_transformed(window_get_width() - 16, window_get_height() - 60, "Seeds: " + string(global.seed_amount), 0, 400,1,1,0);
	
	/// Timer border and text
	if(global.currentTime >= 0) draw_sprite_stretched(sGUI, 0, window_get_width() - 200 - 16, 14, 200, 40);
	
	draw_set_font(fKey);
	if(global.currentTime >= 0) draw_text_ext_transformed(window_get_width() - 100, 4, string(global.currentTime), 0, 400,1,1,0);
});