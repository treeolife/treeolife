/// @description oUIPanelDefenders

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);
	
	var sScale = 32 + 4;
	var units = 3;
	
	#region oUIPanelDefenders 
	
	// Top
	for (unit = 0; unit < units; unit++) {
		draw_sprite_stretched(sGUI, 1, unit*5*sScale/2 + 4*sScale/2, sScale, sScale*1.2, sScale);
		draw_sprite_stretched(sGUI, 0, unit*5*sScale/2 + 4*sScale/2-sScale, sScale, sScale, sScale);
	}
	
	// Bottom
	for (unit = 0; unit < units; unit++) {
		draw_sprite_stretched(sGUI, 1, unit*5*sScale/2 + 4*sScale/2, sScale*2+4, sScale*1.2, sScale);
		draw_sprite_stretched(sGUI, 0, unit*5*sScale/2 + 4*sScale/2-sScale, sScale*2+4, sScale, sScale);
	}
	
	#endregion
	
});