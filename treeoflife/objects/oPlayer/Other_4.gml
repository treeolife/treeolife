/// @description initialise cam, room

instance_create_depth(0,0,0, oRoomInit);
instance_create_depth(0,0,0, oInventory);

oInventory.persistent = true;

global.roomReplay = false;

instance_create_depth(x,y,0, oCamera);
