/// @function TransitionRoom(room);
/// @param {room} room Destination room after transition
function TransitionRoom(room){
	instance_create_depth(0,0,get_layer_depth(LAYER.ui),oTransition);
	oTransition.destinationRoom = room;
}