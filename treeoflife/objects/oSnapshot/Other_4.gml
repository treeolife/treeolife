/// @description 
if (instance_exists(oPlayer)) {
	if (global.inventoryStart == noone)
		global.inventoryStart = ds_list_create();

	for (var i = 0; i < ds_list_size(global.inventory); i++) {
		var copied_item = instance_create_depth(
						0, 0, depth,
						global.inventory[| i].object_index
						);
		// we dont want to see the items already picked
		copied_item.visible = false;
		instance_deactivate_object(copied_item);
	
		ds_list_add(global.inventoryStart, copied_item);
	}

	if (global.defendersStart == noone)
		global.defendersStart = ds_map_create();

	for (var k = ds_map_find_first(global.defenders); !is_undefined(k); k = ds_map_find_next(global.defenders, k)) {
		var oldDefender = global.defenders[? k];
	
		/* Use k, v here */
		var d = instance_create_depth(0,0,depth,oldDefender.object_index);
		d.hp_max = oldDefender.hp_max;
		d.sprite_index = oldDefender.sprite_index;
		d.hp = oldDefender.hp;
		d.damage = oldDefender.damage;
		// consider range
	
		// save into duplicate list based on oSoil position
		ds_map_add(global.defendersStart,k,d); 
  
	}
}
