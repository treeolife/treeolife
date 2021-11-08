/// @description pEnemy
if instance_exists(healthBar) and healthBar != noone
	instance_destroy(healthBar);

if instance_exists(oLand) || instance_exists(oAir) {
	if (instance_number(oLand) + instance_number(oAir) == 1) {
		instance_create_depth(x,y,depth-1,oFertiliser);
		
		if (global.firstTime.droppingFertiliser == -1 && global.wave == 1) {
			NewHighlight(
				sFertiliser,
				window_get_width()/2,
				0,
				100,
				"The last pollution has dropped the fertiliser.",
				true,
				true,
				true);
			global.firstTime.droppingFertiliser = 1;
		}	
		
	} else if (Chance(1.0))
		instance_create_depth(x,y,depth,oWater);
}