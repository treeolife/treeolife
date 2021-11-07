/// @description 
if instance_exists(healthBar) and healthBar != noone
	instance_destroy(healthBar);

// Put this code second so fertiliser spawns above water
if instance_exists(oLand) || instance_exists(oAir) {
	if (instance_number(oLand) + instance_number(oAir) == 1)
		instance_create_depth(x,y,depth-1,oFertiliser);
	else if (Chance(0.8))
		instance_create_depth(x,y,depth,oWater);
}