/// @description 

// Set inventory to player's inventory
inventory = global.inventory;
inventorySize = 0;
inventoryRowLength = 3;

// A list to identify items created
inventoryCreated = ds_list_create();

if (inventory != noone)
	inventorySize = ds_list_size(inventory);
