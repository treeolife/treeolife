/// @function TransitionRoom(room);
/// @param {room} room Destination room after transition
function TransitionRoom(room, transitionText=global.loadingDefault){
	instance_create_depth(0,0,get_layer_depth(LAYER.ui)-300,oTransition);
	oTransition.transition_text = transitionText;
	oTransition.destinationRoom = room;
}