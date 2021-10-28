/// @description 

draw_self();

scr_draw_set(1, c_white, function() {
	scr_set_align(fa_center, fa_middle);
	draw_set_font(fText);
	
	var sScale = sprite_width + 4;
	var units = 3;
	
	var border = 18;
	
	var adjWidth = 200;
	var adjHeight = window_get_height() - border * 2;
	var fullPanelMarginTop = border + 38;
	var fullPanelMarginBot = 120;
	
	// oUIDefenders
	for (unit = 0; unit < units; unit++) {
		draw_sprite_stretched(sGUI, 1, unit*5*sScale/2 + 4*sScale/2, sScale, sScale*1.2, sScale);
		draw_sprite_stretched(sGUI, 0, unit*5*sScale/2 + 4*sScale/2-sScale, sScale, sScale, sScale);
	}
	
	// oInstruction
	draw_sprite_stretched(sGUIFull, 0, window_get_width()/2, sScale * 5.5, adjWidth, sScale);
	draw_sprite(sWater, 0, (window_get_width() - adjWidth)/ 2 + 21, sScale * 5.5);
	
	/// Wave, Water information
	//draw_text_ext_transformed(16, 8, "Wave: " + string(global.wave), 0, 400,1,1,0);
	//draw_text_ext_transformed(16, window_get_height() - 60, "Water: " + string(global.water_amount), 0, 400,1,1,0);
	
	scr_set_align(fa_center, fa_middle);

	/// oUIPanel
	draw_sprite_stretched(sGUIPanel, 0, window_get_width() - adjWidth - border, border + fullPanelMarginTop, adjWidth, adjHeight - fullPanelMarginTop - fullPanelMarginBot);
	
	/// Timer progress bar
	if(global.currentTime >= 0) draw_sprite_stretched(sPlayer, 0, window_get_width() - 118 - 100, 23, 200 * ((global.currentTime) / global.timer) , 35);

	/// Timer border and text
	if(global.currentTime >= 0) draw_sprite_stretched(sGUI, 0, window_get_width() - 118, 40, 200, 40);
	
	draw_set_font(fKey);
	draw_set_color(c_black);
	if(global.currentTime >= 0) draw_text_ext_transformed(window_get_width() - 118, 11, string(global.currentTime), 0, 400,1,1,0);
		
	/// Next stage text
	//if(global.currentTime >= 0) draw_text_ext_transformed(window_get_width() - 200 - 16, 8, "Next", 0, 400,1,1,0);
	
	/// Seeds information
	//draw_text_ext_transformed(window_get_width() - 16, window_get_height() - 60, "Seeds: " + string(global.seed_amount), 0, 400,1,1,0);
	
});