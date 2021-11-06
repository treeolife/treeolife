function PIdle(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			truestate_vars[? "Direction"] = image_xscale;
			sprite_index = sLandIdle;
			image_xscale = truestate_vars[? "Direction"];
			speed_h = 0;
			speed_v = 0;
			truestate_vars[? "Idle time"]=truestate_timer;
			
		}break;
	
		case TRUESTATE_STEP:
		{
			if (hp <= 0)
				truestate_switch(PSTATE.die, true);
				
			if (truestate_timer - truestate_vars[? "Idle time"] > 60 * Chance(0.7) && animation_end()) {
				
				if (Chance(0.2)) {
					if (instance_exists(oTree))
						truestate_switch(PSTATE.aggro);
				} else {
						truestate_switch(PSTATE.wander);
				}
			}
			
			if (truestate_timer > 150)
				truestate_reset_current_state();
		}break;
		
		case TRUESTATE_FINAL:
		{
			truestate_vars[? "Idle time"] = 0;
		}break;
	}
}

function PWander(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			truestate_vars[? "Direction"] = image_xscale;
			sprite_index = sLandIdle;
			image_xscale = truestate_vars[? "Direction"];
			h_speed = 0;
			v_speed = 0;
		}break;
	
		case TRUESTATE_STEP:
		{
			randomize();
			if (Chance(0.8)) {
				image_xscale *= -1;
				truestate_vars[? "Direction"] = image_xscale;
				truestate_vars[? "Wandered"] = true;
			}
			
		}break;
	}
}

function PAggro(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sLandWalk;
			truestate_vars[? "Aggro time"]=truestate_timer;
			target(oTree.defenderArea);
			
		}break;
	
		case TRUESTATE_STEP:
		{
			if (animation_end() 
				&& truestate_timer - truestate_vars[? "Aggro time"] > 80 * Chance(0.7) ) {
					
				truestate_switch(PSTATE.wander);
			}
		}break;
		
		case TRUESTATE_FINAL:
		{
			truestate_vars[? "Direction"] = image_xscale;
			truestate_vars[? "Aggro time"] = 0;
		}break;
	}
}

function PDie(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{			
			truestate_vars[? "Direction"] = image_xscale;
			sprite_index = sLandDie;
			image_xscale = truestate_vars[? "Direction"];
		}break;
	
		case TRUESTATE_STEP:
		{
			if(animation_end()) {
				instance_destroy();
			}
		}break;
	}
}