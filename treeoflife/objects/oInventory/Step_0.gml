/// @description 

// Update inventory size
if (global.inventory != noone)
	inventorySize = ds_list_size(global.inventory);

// Add inventory items in list to our inventory map
for (var item = 0; item < inventorySize; item++) {
	itemId = ds_list_find_value(global.inventory, item);
	
	// If it is not already added, add to created list
	if (ds_list_find_index(inventoryCreated, itemId) == -1) {
		
		// Add item to first empty slot in inventory;
		//for (var inventoryPos = 0; inventoryPos < ds_list_size(global.inventory); inventoryPos++) {
		//	if(ds_list_find_value(global.inventory,inventoryPos) != noone) {
		//		ds_list_set(global.inventory,inventoryPos,item);
		//	}
		//}
		
		// Add to first empty slot
		//for (var inventoryPos = 0; inventoryPos < ds_list_size(inventoryCreated); inventoryPos++) {
		//	if(ds_list_find_value(inventoryCreated,inventoryPos) != noone) {
		//		ds_list_set(inventoryCreated,inventoryPos,itemId);
		//	}
		//}
		
		ds_list_add(inventoryCreated, itemId);
		
		// Create UI element for inventoryCreated if not added
		if (!instance_exists(oUIPanelUnits)) {
			
			instance_create_depth(0,0,get_layer_depth(LAYER.ui),oUIPanelUnits);
		}
		
		// If not already added, draw item in oUIPanelUnits
		oUIPanelUnits.units = inventoryCreated;
	}
}
