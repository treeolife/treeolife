/// @description initialise cam, room

instance_create_depth(0,0,0, oRoomInit);
instance_create_depth(0,0,0, oInventory);

oInventory.persistent = true;

global.roomReplay = false;

oUIPause.pauseTitle = "Paused";

global.gameLost = false;

instance_create_depth(x,y,0, oCamera);
