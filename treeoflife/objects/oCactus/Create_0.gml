/// @description Cactus

event_inherited();

truestate_system_init();

sprite_idle = sCactusIdle;
sprite_attack = sCactusAttack2;
sprite_attack_ranged = sCactusAttack;
sprite_die = sCactusDie;

truestate_create_state(DSTATE.idle, DefenderIdle, "Idle");
truestate_create_state(DSTATE.attack, DefenderAttack, "Attack");
truestate_create_state(DSTATE.die, DefenderDie, "Die");

truestate_set_default(DSTATE.idle);