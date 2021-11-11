function PollutionIdle(_event) {

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
			sprite_index = sprite_idle;
			
			truestate_vars[? "Start round"] = (not global.levelStarted == 0 || global.levelStarted == -1);
			
		}break;
	
		case TRUESTATE_STEP:
		{	
			speed_h = 0;
			speed_v = game_gravity;
			
			if (attacked && attackable) {
				truestate_switch(PSTATE.flinch);
			}
			
			var wanderCooldown = random_range(0,2) * room_speed;
				
			if (truestate_vars[? "Find target cooldown"] < (1 * room_speed))
				truestate_vars[? "Find target cooldown"] += 1;
			else
				truestate_vars[? "Find target cooldown"] = 0;
				
			if(not global.gamePaused) { // -1 allows start screen pollution to move
				if(choose(true,false)) {
				
					if (truestate_timer > wanderCooldown)
						truestate_switch(PSTATE.wander);
					
				} else if (currentTarget != noone 
					&& instance_exists(currentTarget) 
					&& canReachTarget(currentTarget.defenderArea) 
					&& not collision_circle(x,y,32,currentTarget.defenderArea,false,false)
					&& truestate_vars[? "Start round"]) 
					{
						truestate_switch(PSTATE.aggro);

					} else if ((currentTarget == noone || not instance_exists(currentTarget)) && truestate_vars[? "Find target cooldown"] == 0) {
				
						truestate_switch(PSTATE.findTarget);
				}
			}
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing()
		}break;
	}
}


function PollutionFindTarget(_event) {

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

function PollutionWander(_event) {

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
			if (global.gamePaused)
				truestate_switch(PSTATE.idle);
				
			if (attacked && attackable) {
				truestate_switch(PSTATE.flinch);
			}
			
			if (truestate_previous_state != PSTATE.aggro)
				face_direction = truestate_vars[? "Wander Dir"];
			speed_h = 0;
			speed_v = game_gravity;
			
			if(truestate_vars[? "Walk"] && not scr_collision()) {
				var sprite_idle_index = image_number;
				if (not scr_collision()) 
					sprite_index = sprite_walk 
				else { 
					sprite_index = sprite_idle; 
					image_index = sprite_idle_index;
				}
				
				if (truestate_timer < truestate_vars[? "Back to Idle Timer"] || image_index >= 1) {
					
					wallCollideAvoid(image_index);
					
					if (truestate_previous_state == PSTATE.aggro && not scr_collision()) {
						speed_h = -1 * face_direction * movement_speed;
						speed_v = game_gravity;
						
						wallCollideAvoid(image_index);
							
					}
					else if (not scr_collision()){
						speed_h = -1 * truestate_vars[? "Wander Dir"] * movement_speed;
						speed_v = game_gravity;
						
						wallCollideAvoid(image_index);
					}
				} else if (image_index < 1) {
					if (sprite_index = sprite_walk) // avoid freezing idle sprite
						image_index = 0;
					truestate_switch(PSTATE.idle);
				}
			} else {
				sprite_index = sprite_idle;
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

function PollutionAggro(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sprite_walk;
			truestate_vars[? "Back to Wander Timer"] = random_range(0,4) * room_speed;
			if (instance_exists(currentTarget))
				target(currentTarget.defenderArea);
		}break;
	
		case TRUESTATE_STEP:
		{	
			if (global.gamePaused)
				truestate_switch(PSTATE.idle);
			
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

function PollutionFlinch(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{			
			sprite_index = sprite_flinch;	
			truestate_vars[? "Image speed"] = image_speed;
			
			speed_h = 0;
			speed_v = 0;
			
			if (instance_exists(attackedBy) && attackDefender) {
				
				if (attackedBy.object_index == oHitbox || attackedBy.object_index == oSlice) {
					
					currentTarget = attackedBy.origin;
				} else {
					currentTarget = attackedBy;
				}
			}
			
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	
		case TRUESTATE_STEP:
		{
			if (instance_exists(currentTarget))
				face_direction = sign(x - currentTarget.x);
			
			if(animation_end()) {
				image_speed = 0;
				image_index = 0;
			}
			
			if (hp <= 0)
				truestate_switch(PSTATE.die, true);
					
			if (truestate_timer > 20) {
				truestate_switch(PSTATE.aggro);
			}
			
		}break;
		
		case TRUESTATE_FINAL:
		{
			attacked = false;
			image_speed = truestate_vars[? "Image speed"];
		}break;
	}
}

function PollutionDie(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{			
			sprite_index = sprite_die;	
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

function wallCollideAvoid(_image_index) {
	// avoid walking into walls for too long
	if (scr_collision()) {
		sprite_index = sprite_idle;
		image_index = _image_index
	}
}