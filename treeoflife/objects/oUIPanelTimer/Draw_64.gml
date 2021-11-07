/// @description oUIPanelTimer
if (show) {
	scr_draw_set(1, c_white, function() {
		scr_set_align(fa_center, fa_middle);
		draw_set_font(fText);
		draw_set_alpha(image_alpha);
	
		#region oUIPanelTimer
	
		/// Timer background
		draw_sprite_stretched_ext(sGUI, 3, window_get_width() - 118, 40, 200, 40, image_blend, (y/ystart));
	
		/// Bar
		if (time > 0) draw_sprite_stretched_ext(sPlayer, 0, window_get_width() - 118 - 100, y-17, 200 * ((time) / startTime) , 35, 195513, image_alpha);
		else draw_sprite_stretched_ext(sPlayer, 0, window_get_width() - 118 - 100, 23, 200, 35, 195513, (y/ystart));

		/// Timer border and text
		draw_sprite_stretched_ext(sGUI, 2, window_get_width() - 118, 40, 200, 40, image_blend, (y/ystart));
	
		draw_set_font(fKey);
		draw_set_color(c_white);
		scr_set_align(fa_center, fa_middle);

		if(time > 0 && time != startTime && string_length(postText) == 0) draw_text_ext_transformed(window_get_width() - 118, 11, string(time), 0, 400,((y*sign(y))/ystart),1,0);
		if(time == startTime || time <= 0) {
			draw_set_color(timesUpCol);
			var _str;
			if (string_length(postText) > 0) _str = postText; else _str = eventName;
			draw_text_ext_transformed(window_get_width() - 118, 11, string(_str), 0, 400,((y*sign(y))/ystart),1,0);
		}
		
			//if(time == 0) draw_sprite_stretched_ext(sPlayer, 0, window_get_width() - 118 - 100, 23, 200, 35, timesUpCol, 1);
		#endregion
	
	});
}