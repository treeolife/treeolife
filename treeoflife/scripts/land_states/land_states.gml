function LandIdle(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			if(truestate_previous_state == noone) {
				truestate_vars[? "Wander Dir"] = 1;
				truestate_vars[? "Find target cooldown"] = 0;
			}
			if (truestate_previous_state == PSTATE.flinch)
				image_speed = truestate_vars[? "Image speed"];
			sprite_index = sLandIdle;
			
		}break;
	
		case TRUESTATE_STEP:
		{
			speed_h = 0;
			speed_v = game_gravity;
			
			if (attacked && attackable) {
				truestate_switch(PSTATE.flinch);
			}
			
			var wanderCooldown = random_range(0,4) * room_speed;
				
			if (truestate_vars[? "Find target cooldown"] < (2 * room_speed))
				truestate_vars[? "Find target cooldown"] += 1;
			else
				truestate_vars[? "Find target cooldown"] = 0;
				
			if(choose(true,false)) {
				
				if (truestate_timer > wanderCooldown)
					truestate_switch(PSTATE.wander);
					
			} else if (currentTarget != noone 
				&& instance_exists(currentTarget) 
				&& canReachTarget(currentTarget.defenderArea) 
				&& not collision_circle(x,y,32,currentTarget.defenderArea,false,false)) 
				{
					truestate_switch(PSTATE.aggro);

				} else if ((currentTarget == noone || not instance_exists(currentTarget)) && truestate_vars[? "Find target cooldown"] == 0) {
				
					truestate_switch(PSTATE.findTarget);
			}
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing()
		}break;
	}
}


function LandFindTarget(_event) {

	switch(_event)
	{
		case TRUESTATE_STEP:
		{
			// this check isn't needed atm, but good to have for future expansion
			truestate_vars[? "Find target cooldown"] = 0;
			
			if (instance_exists(oTree))
				currentTarget = oTree;
				
			truestate_switch(PSTATE.idle);
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	}
}

function LandWander(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			if (truestate_previous_state != PSTATE.aggro)
				truestate_vars[? "Wander Dir"] = choose(-1,1);
			truestate_vars[? "Back to Idle Timer"] = random_range(0,2) * room_speed;
			truestate_vars[? "Walk"] = choose(true,false);
		}break;
	
		case TRUESTATE_STEP:
		{	
			if (attacked && attackable) {
				truestate_switch(PSTATE.flinch);
			}
			
			if (truestate_previous_state != PSTATE.aggro)
				face_direction = truestate_vars[? "Wander Dir"];
			speed_h = 0;
			speed_v = game_gravity;
			
			if(truestate_vars[? "Walk"]) {
				sprite_index = sLandWalk;
				if (truestate_timer < truestate_vars[? "Back to Idle Timer"] || image_index >= 1) {
					if (truestate_previous_state == PSTATE.aggro) {
						speed_h = -1 * face_direction * GAME_SPEED;
						speed_v = game_gravity;
					}
					else {
						speed_h = -1 * truestate_vars[? "Wander Dir"] * GAME_SPEED;
						speed_v = game_gravity;
					}
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
			if (attacked && attackable) {
				truestate_switch(PSTATE.flinch);
			}
			
			if (truestate_timer > truestate_vars[? "Back to Wander Timer"])
				truestate_switch(PSTATE.wander);
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	}
}

function LandFlinch(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{			
			sprite_index = sLandFlinch;	
			truestate_vars[? "Image speed"] = image_speed;
			
			speed_h = 0;
			speed_v = 0;
			
			if (instance_exists(attackedBy))
				currentTarget = attackedBy;
			
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	
		case TRUESTATE_STEP:
		{
			if(animation_end()) {
				image_speed = 0;
				image_index = 0;
			}
			
			if (hp <= 0)
				truestate_switch(PSTATE.die, true);
					
			if (truestate_timer > 20) {
				truestate_switch(PSTATE.idle);
			}
			
		}break;
		
		case TRUESTATE_FINAL:
		{
			attacked = false;
			image_speed = truestate_vars[? "Image speed"];
		}break;
	}
}

function LandDie(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{			
			sprite_index = sLandDie;	
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