/// @description 

// Creation grow animation
if (!defender_created) {
	curvePosition += curveSpeed;
	//curvePosition = curvePosition mod 1;
	var _curveStruct = animcurve_get(curveAsset);
	var _channel = animcurve_get_channel(_curveStruct, "x");
	var _value = animcurve_channel_evaluate(_channel, curvePosition);
	image_xscale = image_xscale + _value/20;

	var _channel = animcurve_get_channel(_curveStruct, "y");
	var _value = animcurve_channel_evaluate(_channel, curvePosition);
	image_yscale = image_yscale + _value/20;
	
	if curvePosition >= 1
		defender_created = true;
}

if healthBar == noone {
	if defender_created 
		healthBar = instance_create_depth(x, y, get_layer_depth(LAYER.ui), oHealthbar)
} else {
	// Update health bar
	healthBar.update(x, y, hp, hp_max, flash, true);
}

// on death
if hp <= 0 {
	instance_destroy(healthBar);
	instance_destroy();
}