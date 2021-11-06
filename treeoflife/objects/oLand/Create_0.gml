/// @description 

// Inherit the parent event
event_inherited();

attacked = false;
attackedBy = 0;
damage = 0.5;

// Behaviour
attackDefender = true;

enum PSTATE {
	idle,
	wander,
	die,
	aggro,
	flinch,
	attack,
}

truestate_system_init();

truestate_create_state(PSTATE.idle, PIdle, "Idle");
truestate_create_state(PSTATE.aggro, PAggro, "Aggro");
truestate_create_state(PSTATE.die, PDie, "Die");
truestate_create_state(PSTATE.wander, PWander, "Wander");

truestate_set_default(PSTATE.idle);