/// @description 

defenderObj = 0;

function getYHeight(defender_obj) {
	return y;
}

function getXWidth(defender_obj) {
	return x+(oSoil.sprite_width/2);
}

function createDefender(defender_obj) {
	if !plantable
		return;
		
	if defenderId == 0 {
		defenderId = instance_create_depth(
			getXWidth(defender_obj),
			getYHeight(defender_obj),
			LAYER.towers,
			defender_obj);
		defenderObj = defender_obj;
		
		if defender_obj.getCost() > global.water_amount {
			instance_destroy(defenderId);
			return -1;
		}
		global.water_amount -= defender_obj.getCost();
		return defenderId;
	}
		
	if defender_obj != defenderObj {
		defenderObj = defender_obj;
		instance_destroy(defenderId);
		defenderId = instance_create_depth(
			getXWidth(defender_obj),
			getYHeight(defender_obj),
			LAYER.towers,
			defender_obj);
			
		global.water_amount -= defender_obj.getCost();
			
		return defenderId;
	}
	
	return;
}

function isDefender(defender_obj) {
	return defender_obj == defenderObj;
}

function hasDefender() {
	return defenderId != 0;
}