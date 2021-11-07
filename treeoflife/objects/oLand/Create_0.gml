/// @description oLand

// Inherit the parent event
event_inherited();

// Behaviour
attackDefender = true;

truestate_system_init();

sprite_idle = sLandIdle;
sprite_die = sLandDie;
sprite_flinch = sLandFlinch;
sprite_walk = sLandWalk;

truestate_create_state(PSTATE.idle, PollutionIdle, "Idle");
truestate_create_state(PSTATE.findTarget, PollutionFindTarget, "Find target");
truestate_create_state(PSTATE.aggro, PollutionAggro, "Aggro");
truestate_create_state(PSTATE.die, PollutionDie, "Die");
truestate_create_state(PSTATE.wander, PollutionWander, "Wander");
truestate_create_state(PSTATE.flinch, PollutionFlinch, "Flinch");

truestate_set_default(PSTATE.idle);