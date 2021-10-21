/// @description 

if healthBar == noone {
	healthBar = instance_create_depth(x, y, LAYER.towers, oHealthbar)
}

// Update health bar
healthBar.update(x, y, hp, hp_max, flash, true);

// on death
if hp <= 0 {
	instance_destroy(healthBar);
	instance_destroy();
}