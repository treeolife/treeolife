/// @description 

event_inherited();

if (sprite_index == sTreeTree && instance_exists(healthBar) && instance_exists(soil)) {
	healthBar.yy = soil.y - tileDistance.three;
}

if (sprite_index == sTreeFour && instance_exists(healthBar) && instance_exists(soil)) {
	healthBar.yy = soil.y - tileDistance.four;
}

