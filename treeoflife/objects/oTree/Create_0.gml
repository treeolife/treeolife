/// @description attributes

#region Attributes

		hp = 250;
		hp_max = 250;
		flash = 0;

#endregion

#region Health bar

		healthBar = noone;

#endregion

#region Initialise seedlings

		seedlingArray = 0;
		if(seedlingArray == 0) {
			seedlingArray = array_create(6, noone);
			seedlingArray[level.ZERO]	= inst_432D87F;
			seedlingArray[level.ONE]	= noone;
			seedlingArray[level.TWO]	= noone;
			seedlingArray[level.THREE]	= noone;
			seedlingArray[level.FOUR]	= noone;
			seedlingArray[level.FIVE]	= noone;
			global.seedlings = seedlingArray;
		}

#endregion