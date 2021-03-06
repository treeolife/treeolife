/// @description 

function makeItemsPersistent() {
	
	for (var i = 0; i < ds_list_size(global.inventoryStart); i++) {	
		var item = global.inventoryStart[| i];
		instance_activate_object(item);
		item.persistent = true;
	}
		
	for (var i = 0; i < ds_list_size(global.inventory); i++) {
		global.inventory[| i].persistent = false
	}
}

function makeDefendersPersistent() {
	
	for (var k = ds_map_find_first(global.defendersStart); !is_undefined(k); k = ds_map_find_next(global.defendersStart, k)) {
		var oldDefender = global.defendersStart[? k];
		oldDefender.persistent = true;
	}
	
	for (var k = ds_map_find_first(global.defenders); !is_undefined(k); k = ds_map_find_next(global.defenders, k)) {
		var oldDefender = global.defenders[? k];
		oldDefender.persistent = false;
	}
}

function triggerReplay() {
	
	if (global.roomReplay) {
		var _temp = noone;
		var _temp_i = noone;
		_temp = global.defenders;
		_temp_i = global.inventory;
	
		makeDefendersPersistent();
		makeItemsPersistent();
		
		global.inventory = global.inventoryStart;
		global.inventoryStart = noone;
		
		global.defenders = global.defendersStart;
		global.defendersStart = noone;
	
		ds_list_destroy(_temp_i);
		ds_map_destroy(_temp);
	
	}
}