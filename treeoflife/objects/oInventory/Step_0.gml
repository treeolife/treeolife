/// @description 

// Update inventory size
if (inventory != noone)
	inventorySize = ds_list_size(inventory);

// Add inventory items in list to our inventory map
for (var item = 0; item < inventorySize; item++) {
	itemId = ds_list_find_value(inventory, item);
	
	// If it is not already added, add to created list
	if (ds_list_find_index(inventoryCreated, itemId) == -1) {
		
		ds_list_add(inventoryCreated, itemId);
		
		// Create UI element for inventoryCreated if not added
		if (!instance_exists(oUIPanelUnits)) {
			
			instance_create_depth(0,0,get_layer_depth(LAYER.ui),oUIPanelUnits);
		}
		
		// If not already added, draw item in oUIPanelUnits
		oUIPanelUnits.units = inventoryCreated;
	}
}
