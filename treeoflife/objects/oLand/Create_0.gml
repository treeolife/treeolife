/// @description oLand

// Inherit the parent event
event_inherited();

// Behaviour
attackDefender = true;

damage = 1;

sprite_idle = sLandIdle;
sprite_die = sLandDie;
sprite_flinch = sLandFlinch;
sprite_walk = sLandWalk;

ts_pollution.state_create(PSTATE_IDLE, PollutionIdle, "Idle");
ts_pollution.state_create(PSTATE_FIND_TARGET, PollutionFindTarget, "Find target");
ts_pollution.state_create(PSTATE_AGGRO, PollutionAggro, "Aggro");
ts_pollution.state_create(PSTATE_DIE, PollutionDie, "Die");
ts_pollution.state_create(PSTATE_WANDER, PollutionWander, "Wander");
ts_pollution.state_create(PSTATE_FLINCH, PollutionFlinch, "Flinch");

ts_pollution.set_default(PSTATE_IDLE);