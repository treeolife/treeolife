/// @description oUIPanelRight

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);
	
	var sScale = 36;
	var border = 18;
	var adjWidth = 200;
	var adjHeight = window_get_height() - border * 2;
	var fullPanelMarginTop = border + 38;
	var fullPanelMarginBot = 120;
	
	#region oUIPanelRight
	
	draw_sprite_stretched(
		sGUIPanel, 
		0, 
		window_get_width() - adjWidth - border, 
		border + fullPanelMarginTop, 
		adjWidth, 
		adjHeight - fullPanelMarginTop - fullPanelMarginBot);
		
	/// oUITitlePanel
	draw_sprite_stretched(sGUIFull, 0, window_get_width()-border/2-adjWidth/2-10, border*2 + 56, adjWidth, sScale);
	draw_sprite(sWater, 0, (window_get_width() - adjWidth) + 1, border*5 + 2);
	
	#endregion
	
});