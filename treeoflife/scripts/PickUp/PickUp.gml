/// @function PickUp(item);
/// @param {object} item An item object to pick up
function PickUp(item){	
	
	origin = item.interactOrigin;
	
	// Move item from surface to appear in inventory
	// Positioned out of the way
	
	item.x = 0;
	item.y = 0;
	item.visible = false;
	
	// Add item to origin inventory
	inventory = origin.inventory
	ds_list_add(inventory, item);
}