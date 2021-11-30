function PollutionIdle(_event, _layer) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			if(ts_pollution.previous_state == noone) {
				_layer.vars[? "Wander Dir"] = 1;
				_layer.vars[? "Find target cooldown"] = 0;
			}
			if (ts_pollution.previous_state == PSTATE_FLINCH)
				image_speed = _layer.vars[? "Image speed"];
			
			sprite_index = sprite_idle;
			
			_layer.vars[? "Start round"] = (not global.levelStarted == 0 || global.levelStarted == -1);
			
		}break;
	
		case TRUESTATE_STEP:
		{	
			speed_h = 0;
			speed_v = game_gravity;
			
			if (attacked && attackable) {
				_layer.state_switch(PSTATE_FLINCH);
			}
			
			var wanderCooldown = random_range(0,2) * room_speed;
				
			if (_layer.vars[? "Find target cooldown"] < (1 * room_speed))
				_layer.vars[? "Find target cooldown"] += 1;
			else
				_layer.vars[? "Find target cooldown"] = 0;
				
			if(not global.gamePaused) { // -1 allows start screen pollution to move
				if(choose(true,false)) {
				
					if (_layer.timer > wanderCooldown)
						_layer.state_switch(PSTATE_WANDER);
					
				} else if (currentTarget != noone 
					&& instance_exists(currentTarget) 
					&& canReachTarget(currentTarget.defenderArea) 
					&& not collision_circle(x,y,32,currentTarget.defenderArea,false,false)
					&& _layer.vars[? "Start round"]) 
					{
						_layer.state_switch(PSTATE_AGGRO);

					} else if ((currentTarget == noone || not instance_exists(currentTarget)) && _layer.vars[? "Find target cooldown"] == 0) {
				
						_layer.state_switch(PSTATE_FIND_TARGET);
				}
			}
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing()
		}break;
	}
}


function PollutionFindTarget(_event, _layer) {

	switch(_event)
	{
		case TRUESTATE_STEP:
		{
			// this check isn't needed atm, but good to have for future expansion
			_layer.vars[? "Find target cooldown"] = 0;
			
			if (instance_exists(oTree))
				currentTarget = oTree;
				
			_layer.state_switch(PSTATE_IDLE);
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	}
}

function PollutionWander(_event, _layer) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			if (ts_pollution.previous_state != PSTATE_AGGRO)
				_layer.vars[? "Wander Dir"] = choose(-1,1);
			_layer.vars[? "Back to Idle Timer"] = random_range(0,2) * room_speed;
			_layer.vars[? "Walk"] = choose(true,false);
		}break;
	
		case TRUESTATE_STEP:
		{	
			if (global.gamePaused)
				_layer.state_switch(PSTATE_IDLE);
				
			if (attacked && attackable) {
				_layer.state_switch(PSTATE_FLINCH);
			}
			
			if (ts_pollution.previous_state != PSTATE_AGGRO)
				face_direction = _layer.vars[? "Wander Dir"];
			speed_h = 0;
			speed_v = game_gravity;
			
			if(_layer.vars[? "Walk"] && not scr_collision()) {
				var sprite_idle_index = image_number;
				if (not scr_collision()) 
					sprite_index = sprite_walk 
				else { 
					sprite_index = sprite_idle; 
					image_index = sprite_idle_index;
				}
				
				if (_layer.timer < _layer.vars[? "Back to Idle Timer"] || image_index >= 1) {
					
					wallCollideAvoid(image_index);
					
					if (ts_pollution.previous_state == PSTATE_AGGRO && not scr_collision()) {
						speed_h = -1 * face_direction * movement_speed;
						speed_v = game_gravity;
						
						wallCollideAvoid(image_index);
							
					}
					else if (not scr_collision()){
						speed_h = -1 * _layer.vars[? "Wander Dir"] * movement_speed;
						speed_v = game_gravity;
						
						wallCollideAvoid(image_index);
					}
				} else if (image_index < 1) {
					if (sprite_index = sprite_walk) // avoid freezing idle sprite
						image_index = 0;
					_layer.state_switch(PSTATE_IDLE);
				}
			} else {
				sprite_index = sprite_idle;
				if (_layer.timer > _layer.vars[? "Back to Idle Timer"])
					_layer.state_switch(PSTATE_IDLE);
			}
			
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	}
}

function PollutionAggro(_event, _layer) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sprite_walk;
			_layer.vars[? "Back to Wander Timer"] = random_range(0,4) * room_speed;
			if (instance_exists(currentTarget))
				target(currentTarget.defenderArea);
		}break;
	
		case TRUESTATE_STEP:
		{	
			if (global.gamePaused)
				_layer.state_switch(PSTATE_IDLE);
			
			if (attacked && attackable) {
				_layer.state_switch(PSTATE_FLINCH);
			}
			
			if (_layer.timer > _layer.vars[? "Back to Wander Timer"])
				_layer.state_switch(PSTATE_WANDER);
		}break;
		
		case TRUESTATE_DRAW:
		{
			draw_self_facing();
		}break;
	}
}

function PollutionFlinch(_event, _layer) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{			
			sprite_index = sprite_flinch;	
			_layer.vars[? "Image speed"] = image_speed;
			
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
				_layer.state_switch(PSTATE_DIE, true);
					
			if (_layer.timer > 20) {
				_layer.state_switch(PSTATE_AGGRO);
			}
			
		}break;
		
		case TRUESTATE_FINAL:
		{
			attacked = false;
			image_speed = _layer.vars[? "Image speed"];
		}break;
	}
}

function PollutionDie(_event, _layer) {

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