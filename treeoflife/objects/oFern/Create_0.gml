/// @description Fern

event_inherited();

truestate_system_init();

sprite_idle = sFernIdle;
sprite_attack = sFernAttackSpin;
sprite_die = sFernDie;

truestate_create_state(DSTATE.idle, DefenderIdle, "Idle");
truestate_create_state(DSTATE.attack, DefenderAttack, "Attack");
truestate_create_state(DSTATE.die, DefenderDie, "Die");

truestate_set_default(DSTATE.idle);