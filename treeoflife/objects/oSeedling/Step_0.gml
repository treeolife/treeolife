/// @description 

if healthBar == noone {
	healthBar = instance_create_depth(x, y, get_layer_depth(LAYER.defender), oHealthbar)
}

// on death
//if hp == 0 {
//	//instance_destroy(healthBar);
//	//instance_destroy();
//}

// Update health bar
healthBar.update(x, y, hp, hp_max, flash, true);
