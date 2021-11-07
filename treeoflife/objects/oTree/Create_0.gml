/// @description Tree

event_inherited();

#region Attributes

	hp = 250;
	hp_max = 250;

#endregion

truestate_system_init();

sprite_idle = noone;
sprite_attack = noone;
sprite_die = noone;

truestate_create_state(DSTATE.idle, DefenderIdle, "Idle");
truestate_create_state(DSTATE.attack, DefenderAttack, "Attack");
truestate_create_state(DSTATE.die, DefenderDie, "Die");

truestate_set_default(DSTATE.idle);