/// @description 

defenderId = 0;
defenderObj = 0;

function getYHeight(defender_obj) {
	return y-defender_obj.sprite_height+oGrid.cell_height;
}

function getXWidth(defender_obj) {
	return x+(defender_obj.sprite_width/2);
}

function createDefender(defender_obj) {
	if defender_obj.getCost() > global.water_amount
		return -1;
		
	if defenderId == 0 {
		defenderObj = defender_obj;
		defenderId = instance_create_depth(
			getXWidth(defender_obj),
			getYHeight(defender_obj),
			LAYER.towers,
			defender_obj);
			
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