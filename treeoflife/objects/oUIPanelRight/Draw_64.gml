/// @description oUIPanelRight

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);

	#region oUIPanelRight
	
	draw_sprite_stretched(
		sGUIPanel, 
		0, 
		window_get_width() - width - border, 
		border + fullPanelMarginTop, 
		width, 
		height);
	
	#endregion
	
});