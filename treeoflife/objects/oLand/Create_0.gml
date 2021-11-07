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
	findTarget
}

truestate_system_init();

truestate_create_state(PSTATE.idle, LandIdle, "Idle");
truestate_create_state(PSTATE.findTarget, LandFindTarget, "Find target");
truestate_create_state(PSTATE.aggro, LandAggro, "Aggro");
truestate_create_state(PSTATE.die, LandDie, "Die");
truestate_create_state(PSTATE.wander, LandWander, "Wander");
truestate_create_state(PSTATE.flinch, LandFlinch, "Flinch");

truestate_set_default(PSTATE.idle);