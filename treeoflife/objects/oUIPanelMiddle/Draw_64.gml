/// @description oUIPanelMiddle
event_inherited();

scr_draw_set(1, c_black, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fInventory);
	
	#region oUIPanelMiddle
	
	draw_sprite_stretched(sGUIPanel, 0, x- width/2, y, width, height);
	draw_text_ext(x,y + height/2 + (2*border/3),message,12,width - border * 2)
	#endregion
	
});