/// @function TransitionRoom(room);
/// @param {room} room Destination room after transition
function TransitionRoom(room, transitionText="Transitioning..."){
	instance_create_depth(0,0,get_layer_depth(LAYER.ui)-100,oTransition);
	oTransition.transition_text = transitionText;
	oTransition.destinationRoom = room;
}