/// @description pEnemy
if instance_exists(healthBar) and healthBar != noone
	instance_destroy(healthBar);
	
var chance = 0;
if (global.wave == 0) chance = 1.0;
if (global.wave == 1) chance = 1.0;
if (global.wave == 2) chance = 1.0;
if (global.wave == 3) chance = 0.4;
if (global.wave == 4) chance = 0.2;

if instance_exists(oLand) || instance_exists(oAir) {
	if (instance_number(oLand) + instance_number(oAir) == 1) {
		instance_create_depth(x,y,depth-1,oFertiliser);
		
		if (global.firstTime.droppingFertiliser == -1 && global.wave == 1) {
			NewHighlight(
				sFertiliser,
				window_get_width()/2,
				0,
				100,
				"The last pollution has dropped fertiliser.",
				true,
				true,
				true);
			global.firstTime.droppingFertiliser = 1;
		}	
		
	} else if (Chance(chance))
		instance_create_depth(x,y,depth,oWater);
}