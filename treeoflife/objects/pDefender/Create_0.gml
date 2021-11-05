/// @description 

event_inherited();

// Creation grow animation
curveCompleted = false;
curvePosition = 0;
curveSpeed = 0.02;

// Attributes
defenderLevel = 1;
hp = 100;
hp_max = 100;
flash = 0;

cost = oSeed;
costQuantity = 1;

// Health bar
healthBar = noone;

damage = 2;

// Only visible after animating starts
image_alpha = 0;

function getCost() {
	return { 
		costQuantity: costQuantity,
		cost: cost,
	};
}

function animateCurve(
	curveSpeed, 
	curvePosition, 
	curveAsset) {
	
	image_alpha = 1;
	curvePosition += curveSpeed;
	var _curveStruct = animcurve_get(curveAsset);
	var _channel = animcurve_get_channel(_curveStruct, "x");
	var _value = animcurve_channel_evaluate(
		_channel,
		curvePosition);
	var output = _value/1;
	return { curvePosition:curvePosition, output:output };
}

function checkResources(price) {
	var outstandingValue = price.costQuantity;
	
	for (
		var costItem = 0; 
		costItem < instance_number(price.cost); 
		costItem++) {
			
		// quick check of items picked up
		if (!instance_find(price.cost, costItem).visible) {
			outstandingValue--;
		}
		
		if (outstandingValue == 0)
			return true;
	}
	
	return false;
}