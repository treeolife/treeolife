/// @description 

// Inherit the parent event
event_inherited();

if (state == states.idle || state == states.walk) {
	state_set(states.idle);
}