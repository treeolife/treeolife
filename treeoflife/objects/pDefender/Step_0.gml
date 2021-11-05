/// @description 

event_inherited();

// Creation grow animation
//if (!curveCompleted) {
//	if curvePosition >= 1
//		curveCompleted = true;
//}

defenderArea.x = x;
defenderArea.y = y - 16;

var curve = animateCurve(
	curveSpeed, 
	curvePosition,
	animCurveDefenderGrow); 
	
curvePosition = curve.curvePosition;

image_xscale = curve.output;
image_yscale = curve.output;

if healthBar == noone {
	if curveCompleted 
		healthBar = instance_create_depth(
			x,
			y,
			get_layer_depth(LAYER.ui), 
			oHealthbar);
} else {
	// Update health bar
	healthBar.update(x, y, hp, hp_max, flash, true);
}

// on death
if hp <= 0 {
	instance_destroy(healthBar);
	instance_destroy();
}