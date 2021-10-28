/// @description oUIPanelHighlight

scr_draw_set(1, c_white, function() {
	
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);
	var sScale = 32 + 4;
	var adjWidth = 200;
	
	#region oUIPanelHighlight
	
	draw_sprite_stretched(sGUIFull, 0, window_get_width()/2, sScale * 5.5, adjWidth, sScale);
	draw_sprite(sWater, 0, (window_get_width() - adjWidth)/ 2 + 20, sScale * 5.5);
	
	#endregion

});