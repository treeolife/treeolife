/// @description oUIPanelUnits

scr_draw_set(1, c_black, function() {
	scr_set_align(fa_left, fa_middle);
	draw_set_font(fInventory);
	
	var border = 4;
	var gridSize = 32;
	var sScale = gridSize + border;
	
	#region oUIPanelUnits
	if (units != noone) {
		
		unitsSize = ds_list_size(units);
		
	// Top
		for (unit = 0; unit < unitsSize; unit++) {
			
			u = ds_list_find_value(units, unit);
			unitSprite	= u.sprite_index;
			unitName	= u.entityName;
			
			if (instance_exists(oInventory)) {
				
				var factor = (unit div oInventory.inventoryRowLength);
				var ay = sScale + factor * (sScale + 4);;
				var by = gridSize - border * 4 + 1 + factor * (sScale + 4);
				var cy = gridSize + border / 2 + factor * (sScale + 4);
				
				var xx = (unit mod oInventory.inventoryRowLength) * 10 * sScale / 3;
				
				var lenItemName = string_length(unitName);
				var widthItemNameOffset = string_width(unitName) + border * 3;
				
				draw_sprite_stretched(sGUI, 1, xx + 1.45*sScale + widthItemNameOffset/2, 
										ay, widthItemNameOffset, sScale);
				draw_sprite_stretched(sGUI, 0, xx + 4*sScale/2-sScale, ay, sScale, sScale);
			
				// Item sprite
				draw_sprite_stretched(
					unitSprite, 
					0, 
					xx + sScale/2 + border / 2, 
					by, 
					32, 
					32);
				
				// Item name
				draw_text(
					xx + 3*sScale/2 + border / 2 + 1, 
					cy, 
					unitName); 
		
			} else {
				// UI elements
				draw_sprite_stretched(sGUI, 1, unit*5*sScale/2 + 4*sScale/2, sScale, sScale*1.2, sScale);
				draw_sprite_stretched(sGUI, 0, unit*5*sScale/2 + 4*sScale/2-sScale, sScale, sScale, sScale);
			
				// Item sprite
				draw_sprite_stretched(
					unitSprite, 
					0, 
					unit*5*sScale/2 + sScale/2 + border / 2, 
					gridSize - border * 4 + 1, 
					32, 
					32);
				
				// Item name
				draw_text(
					unit*5*sScale/2 + 3*sScale/2 + border / 2, 
					gridSize + border / 2, 
					unitName);
				
			}
		}
	}
	
	// Bottom
	//for (unit = 0; unit < units; unit++) {
	//	draw_sprite_stretched(sGUI, 1, unit*5*sScale/2 + 4*sScale/2, sScale*2+4, sScale*1.2, sScale);
	//	draw_sprite_stretched(sGUI, 0, unit*5*sScale/2 + 4*sScale/2-sScale, sScale*2+4, sScale, sScale);
	//}
	
	#endregion
	
});