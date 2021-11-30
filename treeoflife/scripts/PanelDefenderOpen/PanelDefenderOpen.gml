enum defenderType {
	tree = 1,
}

function PanelDefenderOpen(){
	
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
			if (i == buttonSelected && buttons[i] != noone) {
				buttons[i].outline = true;
				buttons[i].col_text = c_white;
			} else if (buttons[i] != noone) {
				buttons[i].outline = false;
				buttons[i].col_text = c_black;
			}
		}
	
		if(key_quit) {
			state = PanelDefenderClose;
		}
	
	#endregion
	
	#region Handle Button Action
		
		key_enter = keyboard_check_pressed(vk_enter);
		
		if (not key_enter && action_complete) {
			action_complete = false;
		}
		
		if (action != noone && key_enter && not action_complete) {
			with(oPlayer) {
				scr_play_audio(snd_enter_key, 50, false);
			}
			script_execute(action);
			
			//// run action once
			//action_complete = false;
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
	
	#region Draw the Right Menu based on Soil and Defender
	
		if (!buttonsDrawn) {
			
			var soilPosition = originInstance.defenderPosition[0];
			var upgradeDefender = -1;
			if (originInstance.hasDefender()) upgradeDefender = originInstance.defenderId.defenderLevel > 0;
			if (soilPosition == defenderType.tree) {
				state = PanelDefenderDrawTree; 
			} else if (upgradeDefender) {
				state = PanelDefenderDrawUpgrade;
			} else {
				state = PanelDefenderDraw;
			}
			
			buttonsDrawn = true;
		}
		
	#endregion
}