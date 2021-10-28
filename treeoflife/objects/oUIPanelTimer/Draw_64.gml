/// @description oUIPanelTimer

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);
	
	#region oUIPanelTimer
	
	/// Timer background
	if(global.currentTime >= 0) draw_sprite_stretched(sGUI, 3, window_get_width() - 118, 40, 200, 40);
	
	/// Bar
	if(global.currentTime >= 0) draw_sprite_stretched_ext(sPlayer, 0, window_get_width() - 118 - 100, 23, 200 * ((global.currentTime) / global.timer) , 35, 195513, 1);

	/// Timer border and text
	if(global.currentTime >= 0) draw_sprite_stretched(sGUI, 2, window_get_width() - 118, 40, 200, 40);
	
	draw_set_font(fKey);
	draw_set_color(c_white);
	scr_set_align(fa_center, fa_middle);

	if(global.currentTime >= 0) draw_text_ext_transformed(window_get_width() - 118, 11, string(global.currentTime), 0, 400,1,1,0);
		
	#endregion
	
});