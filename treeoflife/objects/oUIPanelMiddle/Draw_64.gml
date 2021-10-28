/// @description oUIPanelMiddle

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);
	
	var sScale = 32 + 4;
	
	var border = 18;
	
	var adjWidth = 200;
	
	#region oUIPanelMiddle
	
	draw_sprite_stretched(sGUIPanel, 0, window_get_width()/2 - adjWidth, border, adjWidth*2, 228);
	/// oUITitleHelp
	draw_sprite_stretched(sGUIFull, 0, window_get_width()/2-3, border*2, adjWidth*2, sScale);
	draw_sprite(sWater, 0, (window_get_width() - adjWidth*2)/ 2 + 18, border*2);
	
	#endregion
	
});