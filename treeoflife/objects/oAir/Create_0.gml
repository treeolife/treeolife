/// @description oLand

// Inherit the parent event
event_inherited();

// Behaviour
attackDefender = false;

damage = 0.5;

sprite_idle = sAirIdle;
sprite_die = sAirDie;
sprite_flinch = sAirFlinch;
sprite_walk = sAirIdle;

ts_pollution.state_create(PSTATE_IDLE, PollutionIdle, "Idle");
ts_pollution.state_create(PSTATE_FIND_TARGET, PollutionFindTarget, "Find target");
ts_pollution.state_create(PSTATE_AGGRO, PollutionAggro, "Aggro");
ts_pollution.state_create(PSTATE_DIE, PollutionDie, "Die");
ts_pollution.state_create(PSTATE_WANDER, PollutionWander, "Wander");
ts_pollution.state_create(PSTATE_FLINCH, PollutionFlinch, "Flinch");

ts_pollution.set_default(PSTATE_IDLE);