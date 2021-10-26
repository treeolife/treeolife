/// @function PlayerStateIdle();
function PlayerStateIdle(){
	if (positionX == x && positionY == y)
		midoriState = MIDORI.idle;
	
	if (global.gamePaused) {
 		if (keyPause) { // Unpause
 			global.gamePaused = false;
			oUIPause.hide();
 		}
 	} else {
 		if (keyPause) {
 			global.gamePaused = true;
			oUIPause.show();
 			exit;
 		}
		
		if !oUIDefender.isOpen() {
				if (player_input != 0) 
					midoriState = MIDORI.sprint;
				speed_h = player_input * max_speed;
		}
		PlayerAnimateSprite();
	
		scr_collision();
	
		if !place_meeting (x, y+2, oSoil) {
			oUIDefender.hide();
		}
		
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

 			if keyPlant && !oUIDefender.isOpen() {
 				var soil = instance_place(x, y+2, oSoil)
 				if soil && soil.plantable {
 					oUIDefender.show(soil);
 				}
			}
		} #endregion
	}
	
}

#region Legacy system (not in use)
//if player_input != 0
//    {
		//speed_h += player_input * acceleration;
		//speed_h = clamp(speed_h, -max_speed, max_speed);
	//}
		//else
		//{
		//    speed_h = lerp(speed_h, 0, game_friction);
		//}
#endregion	