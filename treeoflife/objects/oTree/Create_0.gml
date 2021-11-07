/// @description Tree

event_inherited();

#region Attributes

		hp = 250;
		hp_max = 250;

#endregion

#region Initialise seedlings

		//seedlingArray = 0;
		//if(seedlingArray == 0) {
		//	seedlingArray = array_create(6, noone);
		//	seedlingArray[level.ZERO]	= inst_432D87F;
		//	seedlingArray[level.ONE]	= noone;
		//	seedlingArray[level.TWO]	= noone;
		//	seedlingArray[level.THREE]	= noone;
		//	seedlingArray[level.FOUR]	= noone;
		//	seedlingArray[level.FIVE]	= noone;
		//}

#endregion

truestate_system_init();

truestate_create_state(DSTATE.idle, DefenderIdle, "Idle");

truestate_set_default(DSTATE.idle);