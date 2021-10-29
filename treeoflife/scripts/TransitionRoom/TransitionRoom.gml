/// @function name([pName]);
/// @param {type} pName OPTIONAL! pDescription
function TransitionRoom(room){
	instance_create_depth(0,0,LAYER.ui,oTransition);
	oTransition.destinationRoom = room;
}