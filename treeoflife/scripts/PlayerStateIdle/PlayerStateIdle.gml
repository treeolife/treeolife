/// @function PlayerStateIdle();
function PlayerStateIdle(){
	if (global.gamePaused) { // Game is paused
 		if (keyPause) { // Unpause
			oUIPause.unpauseGame();
 		}
 	} else { // When game is not paused
		
 		if (keyPause) {
			oUIPause.pauseGame();
 			exit;
 		}
		
		
		if (player_input != 0) 
			midoriState = MIDORI.sprint;
		speed_h = player_input * max_speed;
		
		
		if (speed_v == 0 && 
			speed_h == 0 &&
			positionX == x && 
			positionY == y) {
			
			midoriState = MIDORI.idle;
		}
		
		PlayerAnimateSprite();
	
		scr_collision();
	
		#region Full interaction area
		
		interact = noone;
		
		var _interactionList = ds_list_create();
		var _nearestInteractionMap = ds_map_create();
		var _nearestInteractionMapKeys;
		var _interactionSize = 24;
		var _interactionFound = collision_rectangle_list(	// returns Integer
			x-_interactionSize,
			y-_interactionSize,
			x+_interactionSize,
			y+_interactionSize,
			pEntity,
			false,
			true,
			_interactionList,
			true);
		
		#region Undraw previous interact items
		numPreviousList = ds_list_size(_previousInteractionList);
		while(numPreviousList > 0) {
			var _check = _previousInteractionList[| --numPreviousList];
			if (_check.entityActivateScript != -1) {
				_check.draw = false;
			}
		}
		#endregion
		
		#region Draw interact item
		
		while(_interactionFound > 0) {	// Check nearest interact target
			ds_list_copy(_previousInteractionList, _interactionList);
			var _check = _interactionList[| --_interactionFound];
			if (_check.entityActivateScript != -1) {
				// Add one to distance, prevent using keys of 0, the case of standing directly on object
				//distance = distance_to_point(_check.x, _check.y) + 1;
				distance = floor(abs(x - _check.x)) + 1;
				if(!ds_map_exists(_nearestInteractionMap, distance)) { // Equidistant case not handled
					if (object_get_parent(_check.object_index) == pItem) 
						if(_check.picked) continue;	// Avoid interacting with picked items
						
					ds_map_add(_nearestInteractionMap, distance, _check);
				}
			}
		}
		
		_nearestInteractionMapKeys = array_create(ds_map_size(_nearestInteractionMap));
		numList = ds_list_size(_interactionList);
		
		if(numList > 0) {
			ds_map_keys_to_array(_nearestInteractionMap, _nearestInteractionMapKeys);
			array_sort(_nearestInteractionMapKeys, function(elm1, elm2) {
				return elm1 - elm2;
			});
			
			for (var i = 0; i < array_length(_nearestInteractionMapKeys); i++) {
				if (_nearestInteractionMapKeys[i] > 0) {
					interact = ds_map_find_value(_nearestInteractionMap, _nearestInteractionMapKeys[i]);
					interact.draw = true;
					
					break;
				}
			}
			
			//break;
		}
		
		ds_map_destroy(_nearestInteractionMap);
		
		#endregion
			
		#region Undraw interaction outline when multiple in range	
		
		while(numPreviousList > 0) {
				var _check = _previousInteractionList[| --numPreviousList];
				if (_check.entityActivateScript != -1) {
					if (numList == 0) {
						_check.draw = false;
					} else {
						if(interact != _check)
							_check.draw = false;
					}
				}
		}
		
		ds_list_destroy(_interactionList);
	
		#endregion
	
		#region Interaction logic on key press
		if (keyInteract && !global.Dialog) {
			
			if (interact == noone || 
				interact.entityActivateScript == -1) {
				
				if (debugger_mode) {
					show_debug_message("no entity");
				}
			} else {
				
				if (oPlayer != noone) { // We should check for null value in player state
					with(interact) {
						interactOrigin = other;
					}
				}
				
				// Interact with entity
				script_execute_ext(
					interact.entityActivateScript,
					interact.entityActivateArgs);
				
				if (interact.entityNPC) {
					with (interact) {
						// Do something with the npc
					}
				}
			}
		}
		#endregion
		
		#endregion
		
 		#region If not on ground, apply game gravity in vertical movement 
 		if !place_meeting (x, y+1, oCollision) {	
			
 			speed_v += game_gravity;
 		} 
 		#endregion
		
 		#region Else If on ground, go to Jump state
 		else {
 			if keySpace {
				
 				state = PlayerStateJump;	
 			}

 			//if keyInteract && !oUIDefender.isOpen() {
				
 			//	var soil = instance_place(x, y+2, oSoil)
 			//	if soil && soil.plantable {
					
 			//		oUIDefender.show(soil);
 			//	}
			//}
		} #endregion
	}
	
}