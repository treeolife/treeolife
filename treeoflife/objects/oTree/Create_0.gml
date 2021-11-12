/// @description Tree

event_inherited();

#region Attributes

	hp_max = 50;
	hp = hp_max;

#endregion

truestate_system_init();

sprite_idle = sTreeOne;
sprite_attack = sTreeOne;
sprite_die = sTreeOne;

truestate_create_state(DSTATE.idle, DefenderIdle, "Idle");
truestate_create_state(DSTATE.die, DefenderDie, "Die");

truestate_set_default(DSTATE.idle);