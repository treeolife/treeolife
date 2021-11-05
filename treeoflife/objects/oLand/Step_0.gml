/// @description 

// Inherit the parent event
event_inherited();

if (state == states.idle) {
	//state_set(states.idle);
	
	state_set_aggro(states.aggro);
}