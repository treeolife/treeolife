/// @function PlayerStateIdle();
function PlayerStateIdle(){
	if !oUIDefender.isOpen()
		speed_h = player_input * max_speed;
	PlayerAnimateSprite();
	scr_collision();
	// TODO: animate midori idle
	
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
		
		if keyPlant {
			var soil = instance_place(x, y+2, oSoil)
			if soil && soil.plantable {
				oUIDefender.show(soil);
			}
		}
	}
	#endregion
	
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