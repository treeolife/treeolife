function LandIdle(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			if(truestate_previous_state == noone)
				truestate_vars[? "Wander Dir"] = 1;
			sprite_index = sLandIdle;
		}break;
	
		case TRUESTATE_STEP:
		{
			h_speed = 0;
			v_speed = game_gravity;
			var wanderCooldown = random_range(0,4) * room_speed;
				
			if(choose(true,false)) {
				if (truestate_timer > wanderCooldown)
					truestate_switch(PSTATE.wander);
			} else if (instance_exists(oTree))
				truestate_switch(PSTATE.aggro);
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing()
		}break;
		
		case TRUESTATE_FINAL:
		{
			
		}break;
	}
}

function LandWander(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			truestate_vars[? "Wander Dir"] = choose(-1,1);
			truestate_vars[? "Back to Idle Timer"] = random_range(0,2) * room_speed;
			truestate_vars[? "Walk"] = choose(true,false);
		}break;
	
		case TRUESTATE_STEP:
		{
			face_direction = truestate_vars[? "Wander Dir"];
			speed_h = 0;
			speed_v = game_gravity;
			
			if(truestate_vars[? "Walk"]) {
				sprite_index = sLandWalk;
				if (truestate_timer < truestate_vars[? "Back to Idle Timer"] || image_index >= 1) {
					speed_h = -1 * truestate_vars[? "Wander Dir"] * GAME_SPEED;
				} else if (image_index < 1) {
					image_index = 0;
					truestate_switch(PSTATE.idle);
				}
			} else {
				sprite_index = sLandIdle;
				if (truestate_timer > truestate_vars[? "Back to Idle Timer"])
					truestate_switch(PSTATE.idle);
			}
			
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	}
}

function LandAggro(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sLandWalk;
			truestate_vars[? "Back to Wander Timer"] = random_range(0,2) * room_speed;
			if (instance_exists(oTree))
				target(oTree.defenderArea);
		}break;
	
		case TRUESTATE_STEP:
		{	
			if (not path_found)
				truestate_switch(PSTATE.wander);
			
			if (truestate_timer > truestate_vars[? "Back to Wander Timer"])
				truestate_switch(PSTATE.wander);
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	}
}

function LandDie(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{			
			
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	
		case TRUESTATE_STEP:
		{
			if(animation_end()) {
				instance_destroy();
			}
		}break;
	}
}