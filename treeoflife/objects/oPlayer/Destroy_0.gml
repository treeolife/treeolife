/// @description 
ds_list_destroy(_previousInteractionList);
instance_destroy(oInventory);
instance_destroy(oUIPanelTimer);
instance_destroy(oGrid);
// oRoomInit omitted because it destroys self after initialisation