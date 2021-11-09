/// @function PickUp(item);
/// @param {object} item An item object to pick up
function PickUp(item){	
	if (item == -1) exit;
	if (item.interactOrigin == noone) exit;
	
	if (global.firstTime.pickingItem == -1 && item.object_index == oSeed) {
		NewHighlight(
			sSeed,
			window_get_width()/2,
			0,
			100,
			"You put the seed into your inventory.",
			true,
			true,
			true);
		global.firstTime.pickingItem = 1;
	}
	
	if (global.firstTime.pickingFertiliser == -1 && item.object_index == oFertiliser) {
		NewHighlight(
			sWater,
			window_get_width()/2,
			0,
			100,
			"Upgrade your defenders with water before feeding the fertiliser to the tree.",
			true,
			true,
			true);
		global.firstTime.pickingFertiliser = 1;
	}
	
	origin = item.interactOrigin;
	item.picked = true;
	
	// Move item from surface to appear in inventory
	// Positioned out of the way
	
	//item.visible = false;
	item.persistent = true;
	item.interactX = origin.x;
	item.pickedTime = 10;
	
	// Add item to origin inventory
	inventory = origin.inventory;
	
	// Add item to inventory;
	ds_list_add(inventory, item);
}