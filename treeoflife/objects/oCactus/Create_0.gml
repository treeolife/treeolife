/// @description Cactus

event_inherited();

truestate_system_init();

truestate_create_state(DSTATE.idle, DefenderIdle, "Idle");

truestate_set_default(DSTATE.idle);