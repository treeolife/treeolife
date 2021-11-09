/// @description 

// Set inventory to player's inventory
inventory = global.inventory;
inventorySize = 0;
inventoryRowLength = 3;

// A list to identify items created
inventoryCreated = ds_list_create();

if (inventory != noone)
	inventorySize = ds_list_size(inventory);

function deductResources(price) {
	var outstandingValue = price.costQuantity;
	
	for (
		var costItem = 0; 
		costItem < instance_number(price.cost); 
		costItem++) {
			
		// quick check of items picked up
		item = instance_find(price.cost, costItem);
		if (!item.visible) {
			outstandingValue--;
			ds_list_delete(global.inventory,ds_list_find_index(global.inventory, item));
			ds_list_delete(inventoryCreated,ds_list_find_index(inventoryCreated , item));
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
	
	for (
		var costItem = 0; 
		costItem < instance_number(cost.cost); 
		costItem++) {
			
		// quick check of items picked up
		if (!instance_find(cost.cost, costItem).visible) {
			outstandingValue--;
		}
		
		if (outstandingValue == 0)
			return true;
	}
	
	return false;
}

function updateInventory() {
	updateItemType(oSeed);
	updateItemType(oWater);
	updateItemType(oFertiliser);
}

function updateItemType(type) {
		for (var item = 0; item < inventorySize; item++) {
		itemId = ds_list_find_value(global.inventory, item);
	
		// If it is not already added, add to created list
		if (ds_list_find_index(inventoryCreated, itemId) == -1) {
			
			if (itemId.object_index == type) {
		
				ds_list_add(inventoryCreated, itemId);
		
				// Create UI element for inventoryCreated if not added
				if (!instance_exists(oUIPanelUnits)) {
			
					instance_create_depth(0,0,get_layer_depth(LAYER.ui),oUIPanelUnits);
				}
		
				// If not already added, draw item in oUIPanelUnits
				oUIPanelUnits.units = inventoryCreated;
			}
		}
	}
}