/// @description Tree

event_inherited();

#region Attributes

	hp_max = 50;
	hp = hp_max;

#endregion

sprite_idle = sTreeOne;
sprite_attack = sTreeOne;
sprite_die = sTreeOne;

ts_defender.state_create(DSTATE_IDLE, DefenderIdle, "Idle");
ts_defender.state_create(DSTATE_DIE, DefenderDie, "Die");

ts_defender.set_default(DSTATE_IDLE);