/// @description 

draw_self();

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);
	
	var sScale = 32 + 4;
	var units = 3;
	
	var border = 18;
	
	var adjWidth = 200;
	var adjHeight = window_get_height() - border * 2;
	var fullPanelMarginTop = border + 38;
	var fullPanelMarginBot = 120;
	
	#region oUIDefenders 
	
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
	
	#region oInstruction
	
	draw_sprite_stretched(sGUIFull, 0, window_get_width()/2, sScale * 5.5, adjWidth, sScale);
	draw_sprite(sWater, 0, (window_get_width() - adjWidth)/ 2 + 21, sScale * 5.5);
	
	#endregion
	
	/// Wave, Water information
	//draw_text_ext_transformed(16, 8, "Wave: " + string(global.wave), 0, 400,1,1,0);
	//draw_text_ext_transformed(16, window_get_height() - 60, "Water: " + string(global.water_amount), 0, 400,1,1,0);
	
	#region oUIPanel
	
	draw_sprite_stretched(sGUIPanel, 0, window_get_width() - adjWidth - border, border + fullPanelMarginTop, adjWidth, adjHeight - fullPanelMarginTop - fullPanelMarginBot);
	/// oUITitlePanel
	draw_sprite_stretched(sGUIFull, 0, window_get_width()-border/2-adjWidth/2-10, border*2 + 56, adjWidth, sScale);
	draw_sprite(sWater, 0, (window_get_width() - adjWidth) + 1, border*5 + 2);
	
	#endregion
	
	#region oUIHelp
	
	draw_sprite_stretched(sGUIPanel, 0, window_get_width()/2 - adjWidth, border, adjWidth*2, 228);
	/// oUITitleHelp
	draw_sprite_stretched(sGUIFull, 0, window_get_width()/2-3, border*2, adjWidth*2, sScale);
	draw_sprite(sWater, 0, (window_get_width() - adjWidth*2)/ 2 + 18, border*2);
	
	#endregion
	
	#region Timer progress bar
	
	if(global.currentTime >= 0) draw_sprite_stretched(sPlayer, 0, window_get_width() - 118 - 100, 23, 200 * ((global.currentTime) / global.timer) , 35);

	/// Timer border and text
	if(global.currentTime >= 0) draw_sprite_stretched(sGUI, 0, window_get_width() - 118, 40, 200, 40);
	
	draw_set_font(fKey);
	draw_set_color(c_black);
	scr_set_align(fa_center, fa_middle);

	if(global.currentTime >= 0) draw_text_ext_transformed(window_get_width() - 118, 11, string(global.currentTime), 0, 400,1,1,0);
		
	#endregion
	
	/// Next stage text
	//if(global.currentTime >= 0) draw_text_ext_transformed(window_get_width() - 200 - 16, 8, "Next", 0, 400,1,1,0);
	
	/// Seeds information
	//draw_text_ext_transformed(window_get_width() - 16, window_get_height() - 60, "Seeds: " + string(global.seed_amount), 0, 400,1,1,0);
	
});