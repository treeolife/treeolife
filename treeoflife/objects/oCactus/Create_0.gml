/// @description 

// Creation grow animation
curveCompleted = false;
curvePosition = 0;
curveSpeed = 0.02;

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

function animateCurve(
	curveSpeed, 
	curvePosition, 
	curveAsset) {
		
	curvePosition += curveSpeed;
	var _curveStruct = animcurve_get(curveAsset);
	var _channel = animcurve_get_channel(_curveStruct, "x");
	var _value = animcurve_channel_evaluate(
		_channel,
		curvePosition);
	var output = _value/1;
	return { curvePosition:curvePosition, output:output };
}
