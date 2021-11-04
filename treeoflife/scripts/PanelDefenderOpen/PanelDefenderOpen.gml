function PanelDefenderOpen(){
	if (debugger_mode) show_debug_message("Open defender panel");
	
	#region Handle Input
	
		key_quit = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Z"));
		key_up = keyboard_check_pressed(vk_up);
		key_down = keyboard_check_pressed(vk_down);
		key_change = key_down - key_up;
	
		buttonSelected += (key_change);

		// Wrap around
		if (buttonSelected >= array_length(buttons))
			buttonSelected = 0;
		if (buttonSelected < 0) {
			buttonSelected = array_length(buttons) -1;
		}
	
		// Options
		for (var i = 0; i < array_length(buttons); i++) {
			if (i == buttonSelected) {
				buttons[i].outline = true;
				buttons[i].col_text = c_white;
			} else {
				buttons[i].outline = false;
				buttons[i].col_text = c_black;
			}
		}
	
		if(key_quit)
			state = PanelDefenderClose;
	
	#endregion
	
	#region Handle Button Action
	
		key_enter = keyboard_check_pressed(vk_enter);
		
		if(key_enter) {
			
			switch(buttonSelected) {
				case orderedButtonMenu.close:
					state = PanelDefenderClose;
					break;
				case orderedButtonMenu.cactus:
					originInstance.createDefender(oCactus);
					state = PanelDefenderClose;
					break;
				case orderedButtonMenu.tree:
					originInstance.createDefender(oTree);
					state = PanelDefenderClose;
					break;
				default:
					break;
			}
			
		}
	
	#endregion
	
	#region Handle Open Animation
	
		if(xTarget < x) {
			xFactor = (x - xTarget) / (room_speed / 8)
			x -= xFactor;
			title.x -= xFactor;
		
			if(buttonsDrawn) {
				for (var b = 0; b < array_length(buttons); b++) {
					buttons[b].x -= xFactor;
				}
			}
		}
	
	#endregion
	
	#region Prevent Player Movement Controls
	
		with (oPlayer) {
			if (state != PlayerStateLocked) {
			
				lastState = state;
				state = PlayerStateLocked;
			}
		}
		
	#endregion
	
	#region Draw Menu GUI
	
		if (!buttonsDrawn) {
			state = PanelDefenderDraw; 
			buttonsDrawn = true;
		}
		
	#endregion
}