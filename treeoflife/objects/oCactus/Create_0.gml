/// @description 

// Creation grow animation
defender_created = false;
curveAsset = animCurveDefenderGrow;
curvePosition = 0;
curveSpeed = 0.05;

// Attributes
hp = 100;
hp_max = 100;
flash = 0;

cost = 20;

// Health bar
healthBar = noone;

damage = 2;

function getCost() {
	return cost;
}