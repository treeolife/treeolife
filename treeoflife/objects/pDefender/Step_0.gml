/// @description ts pDefender

event_inherited();

#region If defender being attacked, set invulnerability for timer
	// Grant invulnerability for attackableTimer
	if (attacked) {
		if (attackableTime > 0) {
			attackable = false;	
		}
	}

	if (attackableTime > 0)
	attackableTime--;

	if (attackableTime == 0) { // Make attackable and vulnerable, reset timer
		attackable = true;
		attackableTime = attackableTimeMax;
	}
#endregion

// Creation grow animation
if (curvePosition >= 1) {
	curveCompleted = true;
}

if defenderArea != noone && instance_exists(defenderArea) {
	defenderArea.x = x;
	defenderArea.y = y - 16;
	if (persistent && instance_exists(defenderArea)) defenderArea.persistent = true;
		else if (instance_exists(defenderArea)) defenderArea.persistent = false;
} else {
	if (persistent)
		defenderArea = instance_create_depth(x,y-16,depth,oDefenderArea);
		if instance_exists(defenderArea)
			defenderArea.persistent = true;
}

var curve = animateCurve(
	curveSpeed, 
	curvePosition,
	animCurveDefenderGrow); 
	
curvePosition = curve.curvePosition;

image_xscale = curve.output;
image_yscale = curve.output;

if healthBar == noone {
	if curveCompleted {
		healthBar = instance_create_depth(
			x,
			y,
			get_layer_depth(LAYER.ui), 
			oHealthbar);
		healthBar.persistent = true;
	}
} else {
	// Update health bar
	if (instance_exists(healthBar))
		healthBar.update(x, y, hp, hp_max, flash, true);
}

// on death
if hp <= 0 {
	instance_destroy(healthBar);
}

truestate_step();