function DefenderIdle(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sprite_idle;
		}break;
	
		case TRUESTATE_STEP:
		{
			if not visible
				truestate_switch(DSTATE.idle, true);
			
			attacked = false;
			switch (id.object_index) {
				
				case oFern: {
					
					if(collision_circle(x,y,tileDistance.seven,pEnemy,false,true))
					{
						if (not global.gamePaused) 
							truestate_switch(DSTATE.ranged_attack);
					}
				
				}break;
				
				case oCactus: {
				
					if(collision_circle(
							x, y, 
							tileDistance.two,
							pEnemy,
							false,
							true)
						) 
					{
						if (not global.gamePaused) 
							truestate_switch(DSTATE.attack);
					}
				}
				break;
				
					
				case oTree: {
					
					if (hp <= 0) {
						truestate_switch(DSTATE.die, true);
					}
					
				}break;
				
			}
			
		}break;
	
	
		case TRUESTATE_DRAW:
		{
	
		}break;
	
	
		case TRUESTATE_FINAL:
		{
			
		}break;
	}
}

function DefenderAttack(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sprite_attack;
			scr_play_audio(snd_plant_attack, 20, false);
			
		}break;
	
		case TRUESTATE_STEP:
		{
			if (hp <= 0) {
				truestate_switch(DSTATE.die, true);
			}
			
			if (animation_end()) {
				var _hitbox = instance_create_depth(x,y,depth,oHitbox);
				_hitbox.origin = id;
				_hitbox.damage = damage; // use defender damage
				_hitbox.sprite_index = sprite_attack;
				_hitbox.image_xscale = image_xscale;
				
				truestate_switch(DSTATE.idle);
			}
			
		}break;
	}
}

function DefenderAttackTwo(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sprite_attack;
		}break;
	
		case TRUESTATE_STEP:
		{
			if (hp <= 0) {
				truestate_switch(DSTATE.die, true);
			}
			
			if (animation_end()) {
				
				nearest = instance_nearest(x,y,pEnemy);
				if (distance_to_object(nearest) < tileDistance.seven) {
					var _slice = instance_create_depth(x,y,depth, oSlice);
					//_slice.image_speed = 0;

					_slice.target_to_hit = nearest;
					_slice.sprite_index = sSlice;
					_slice.origin = id;
					_slice.damage = damage;
					_slice.image_xscale = image_xscale;
			
				}
				
				truestate_switch(DSTATE.idle);
			}
			
		}break;
	
	
		case TRUESTATE_DRAW:
		{
	
		}break;
	
	
		case TRUESTATE_FINAL:
		{
			
		}break;
	}
}

function DefenderDie(_event) {

	switch(_event)
	{
		case TRUESTATE_NEW:
		{
			sprite_index = sprite_die;
			scr_play_audio(snd_plant_death, 20, false);
		}break;
	
		case TRUESTATE_STEP:
		{
			if (animation_end())
				instance_destroy();
		}break;
	
	
		case TRUESTATE_DRAW:
		{
	
		}break;
	
	
		case TRUESTATE_FINAL:
		{
			
		}break;
	}
}