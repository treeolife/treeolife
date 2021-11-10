if (global.roomReplay) exit;

if global.inventoryStart != noone
	ds_list_destroy(global.inventoryStart);

if global.defendersStart != noone
	ds_map_destroy(global.defendersStart);
	
global.inventoryStart = noone;
global.defendersStart = noone;
