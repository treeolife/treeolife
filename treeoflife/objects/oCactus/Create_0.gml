/// @description Cactus

event_inherited();

sprite_idle = sCactusIdle;
sprite_attack = sCactusAttack2;
sprite_attack_ranged = sCactusAttack;
sprite_die = sCactusDie;

ts_defender.state_create(DSTATE_IDLE, DefenderIdle, "Idle");
ts_defender.state_create(DSTATE_ATTACK, DefenderAttack, "Attack");
ts_defender.state_create(DSTATE_DIE, DefenderDie, "Die");

ts_defender.set_default(DSTATE_IDLE);