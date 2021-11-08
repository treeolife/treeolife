/// @description 

event_inherited();

defenderObj = 0;

function loadDefender() {
	defenderId = ds_map_find_value(global.defenders,defenderPosition[0]);
	if (defenderId != 0)
	{
		defenderId.x = x;
		defenderId.y = y;
		defenderId.soil = id;
		defenderId.visible = true;
		if (instance_exists(defenderId.healthBar))
			defenderId.healthBar.visible = true;
	}
	
	if (debugger_mode)
		if (hasDefender())
			if (instance_exists(defenderId.defenderArea))
				defenderId.defenderArea.visible = true;
}

function hideDefender() {
	if(instance_exists(defenderId)) {
		defenderId.visible = false;
		if(instance_exists(defenderId.defenderArea)) {
			defenderId.defenderArea.visible = false;
		}
		if(instance_exists(defenderId.healthBar)) {
			defenderId.healthBar.visible = false;
		}
	}
}

function getYHeight(defender_obj) {
	return y;
}

function getXWidth(defender_obj) {
	return x;
}

function createDefender(defender_obj) {
	if (!oInventory.playerHasResourcesFor(defender_obj)) return;
		
	// no defender on soil
	if defenderId == 0 {
		defenderId = instance_create_depth(
			getXWidth(defender_obj),
			getYHeight(defender_obj),
			get_layer_depth(LAYER.defender),
			defender_obj);
		defenderObj = defender_obj;
		if instance_exists(defenderId) {
			with(defenderId) {
				persistent = true;
				soil = other.id;
			}
		}
		
		if defenderPosition[0] != 0
			ds_map_add(global.defenders,defenderPosition[0],defenderId); 
		
		//if (!checkResources(defender_obj.getCost())) {
		//	instance_destroy(defenderId);
		//	return -1;
		//}
		
		oInventory.deductResources(defender_obj.getCost());
		
		return defenderId;
	}
	
	// different defender chosen than the one on soil
	if defender_obj != defenderObj {
		defenderObj = defender_obj;
		instance_destroy(defenderId);
		defenderId = instance_create_depth(
			getXWidth(defender_obj),
			getYHeight(defender_obj),
			get_layer_depth(LAYER.defender),
			defender_obj);
			
		if instance_exists(defenderId) {
			defenderId.persistent = true;
			defenderId.soil = self;
		}
			
		if defenderPosition[0] != 0
			ds_map_replace(global.defenders,defenderPosition[0],defenderId); 
			
		oInventory.deductResources(defender_obj.getCost());
			
		return defenderId;
	}
	
	//defenderId.healthbar = instance_create_depth(x, y, LAYER.defender, oHealthbar);
	
	return;
}

function isDefender(defender_obj) {
	return defender_obj == defenderObj;
}

function hasDefender() {
	return defenderId != 0 && instance_exists(defenderId);
}

function removeDefender() {
	defenderId = 0;	
	defenderObj = 0;
	ds_map_delete(global.defenders,defenderPosition[0]);
	return;
}