/// @function PickUp(item);
/// @param {object} item An item object to pick up
function PickUp(item){	
	if (item == -1) exit;
	if (item.interactOrigin == noone) exit;
	
	origin = item.interactOrigin;
	item.picked = true;
	
	// Move item from surface to appear in inventory
	// Positioned out of the way
	
	//item.visible = false;
	item.persistent = true;
	item.interactX = origin.x;
	item.pickedTime = 10;
	
	// Add item to origin inventory
	inventory = origin.inventory
	ds_list_add(inventory, item);
}