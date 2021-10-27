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
		
		if !oUIDefender.isOpen() {
				if (player_input != 0) 
					midoriState = MIDORI.sprint;
				speed_h = player_input * max_speed;
		}
		
		if (speed_v == 0 && 
			speed_h == 0 &&
			positionX == x && 
			positionY == y) {
			
			midoriState = MIDORI.idle;
		}
		
		PlayerAnimateSprite();
	
		scr_collision();
	
		#region Interaction logic
		if (keyInteract) {
			
			// Collision mask of 10 px border around player
			//var _activateX = lengthdir_x(10, direction);
			//var _activateY = lengthdir_y(10, direction);
			interact = instance_position(
				x, y, pEntity);
			
			if (interact == noone || 
				interact.entityActivateScript == -1) {
				
				if (debugger_mode) {
					show_debug_message("no entity");
				}
			} else {
				
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
	
		#region Remove defender UI if not colliding on soil
		if !place_meeting (x, y+2, oSoil) {
			oUIDefender.hide();
		}
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

 			if keyInteract && !oUIDefender.isOpen() {
 				var soil = instance_place(x, y+2, oSoil)
 				if soil && soil.plantable {
 					oUIDefender.show(soil);
 				}
			}
		} #endregion
	}
	
}