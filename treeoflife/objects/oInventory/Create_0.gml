/// @description 

// Set inventory to player's inventory
inventory = global.inventory;
inventorySize = 0;
inventoryRowLength = 3;

// A list to identify items created
inventoryCreated = ds_list_create();

if (inventory != noone)
	inventorySize = ds_list_size(inventory);

function findMyResources(type) {
	var amount = 0;
	for (var i = 0; i < ds_list_size(global.inventory) ; i++) {
		if (global.inventory[| i].object_index == type) {
			amount++;
		}
	}
	return amount;
}

function deductResources(price) {
	var outstandingValue = price.costQuantity;	
		
	//for (var i = 0; i < ds_list_size(global.inventory) ; i++) {
	//	if (global.inventory[| i].object_index == price.cost && outstandingValue != 0) {
	//		var item = global.inventory[| i];
	//		item.persistent = false;
	//		instance_destroy(item);
	//		outstandingValue--;
	//	}
	//}

	//return;
	
	
	for (
		var costItem = 0; 
		costItem < findMyResources(price.cost); 
		costItem++) {
			
		// quick check of items picked up
		item = instance_find(price.cost, costItem);
				
		if (!item.visible) {
			outstandingValue--;
			ds_list_delete(global.inventory,ds_list_find_index(global.inventory, item));
			item.persistent = false;
			instance_destroy(item);
		}
		
		if (outstandingValue == 0)
			return;
	}
}

// handle uncoupled logic from defender to check on cost
function playerHasResourcesFor(defender_obj) {
	var _obj = noone;
	var checkBaseCost = false;
	
	// create first instance to check attributes
	if !instance_exists(defender_obj) {
		_obj = instance_create_depth(0,0,0,defender_obj);
		// base cost
		checkBaseCost = true;
	} else {
		// existing cost
		_obj = defender_obj;
	}
	
	// getCost() returns a struct with costQuantity and cost (type of resource)
	var cost = _obj.getCost();
	
	// the logic above should come from pDefender, but due to lack of time...
	if (!_obj.checkResources(cost)) {
		return false;
	}
		
	// destroy entity used for checking base cost
	if (_obj != noone && checkBaseCost)
		instance_destroy(_obj);
	return true;
}

function playerHasResources(cost) {
	var outstandingValue = cost.costQuantity;
	
	return findMyResources(cost.cost) >= cost.costQuantity;
	
	//for (
	//	var costItem = 0; 
	//	costItem < findMyResources(cost.cost); 
	//	costItem++) {
			
	//	// quick check of items picked up
	//	if (!instance_find(cost.cost, costItem).visible) {
	//		outstandingValue--;
	//	}
		
	//	if (outstandingValue == 0)
	//		return true;
	//}
	
	//return false;
}

function updateInventory() {
	if (instance_exists(oPlayer)) {
		updateItemType(oSeed);
		updateItemType(oWater);
		updateItemType(oFertiliser);
	}
}

function updateItemType(type) {
	_continue = false;
	
	with (type) {
		if (persistent)
			other._continue = true;
	}

	if (not _continue && inventoryHasType(type)) {
		ds_list_delete(inventoryCreated, getItemIndexByType(type));
	}
		
	if (not _continue) {
		return;
	}

	var itemQuantity = 0;
	var itemIcon = type.sprite_index;
	var itemName = type.entityName;
		
	for (var item = 0; item < inventorySize; item++) {
	itemId = ds_list_find_value(global.inventory, item);
	 
		// If it is not already added, add to created list
		if (ds_list_find_index(global.inventory, itemId) != -1) {
			
			if (itemId.object_index == type) {
				itemQuantity++;
			}
		}
	}
	
	var itemText = string(itemName) + " x " + string(itemQuantity);

	var itemIndex = getItemIndexByType(type);
	
	if itemIndex == -1
		ds_list_add(inventoryCreated, [itemIcon, itemText, type]);
	else if (itemQuantity > 0) {
		ds_list_set(inventoryCreated, itemIndex, [itemIcon, itemText, type]);
	} else {
		ds_list_delete(inventoryCreated, itemIndex);
	}
	
	// Create UI element for inventoryCreated if not added
	if (!instance_exists(oUIPanelUnits)) {
			
		instance_create_depth(0,0,get_layer_depth(LAYER.ui),oUIPanelUnits);
	}
		
	// If not already added, draw item in oUIPanelUnits
	oUIPanelUnits.units = inventoryCreated;
	
}

function getItemIndexByType(itemType) {
	for (var index = 0; index < ds_list_size(inventoryCreated); index++) {
		if (inventoryCreated[| index][2] == itemType)
			return index;
	}
	return -1;
}

function inventoryHasType(type) {
	for (var i = 0; i < ds_list_size(inventoryCreated); i++) {
		if (inventoryCreated[| i][2] == type)
			return true;
	}
	return false;
}