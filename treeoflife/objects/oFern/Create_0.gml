/// @description Fern

event_inherited();

sprite_idle = sFernIdle;
sprite_attack = sFernAttackSpin;
sprite_die = sFernDie;
sprite_ranged_attack = sSlice;

ts_defender.state_create(DSTATE_IDLE, DefenderIdle, "Idle");
ts_defender.state_create(DSTATE_ATTACK, DefenderAttack, "Attack");
ts_defender.state_create(DSTATE_RANGED_ATTACK, DefenderAttackTwo, "Ranged Attack");
ts_defender.state_create(DSTATE_DIE, DefenderDie, "Die");

ts_defender.set_default(DSTATE_IDLE);