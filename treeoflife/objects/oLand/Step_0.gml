/// @description oLand

// Inherit the parent event
event_inherited();

// if state is -1 then initialise

//if (state == states.idle || state == states.walk) {
//	if (hp < hp_max)
//		state_set(states.flinch);
//	else
//	if (Chance(0.5))
//		state_set(states.idle);
//	else
//		state_set_aggro(states.aggro);
//}

//if (state == states.idle) {
//	if (hp < hp_max)
//		state_set(states.flinch);
//	else
//		if (0.5 > random(1))
//			if (instance_exists(oTree))
//				state_set_aggro(states.aggro);
//			else
//				state_set(states.idle);
//}

truestate_step();