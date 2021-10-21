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
			seedlingArray[level.ZERO]	= noone;
			seedlingArray[level.ONE]	= inst_52C744DE;
			seedlingArray[level.TWO]	= inst_2D47EF8B;
			seedlingArray[level.THREE]	= inst_62AAB3A5;
			seedlingArray[level.FOUR]	= inst_5D9B2EAF;
			seedlingArray[level.FIVE]	= noone;
			global.seedlings = seedlingArray;
		}

#endregion