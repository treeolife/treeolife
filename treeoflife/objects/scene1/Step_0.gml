/// @description 

if (!global.Dialog) {
	instance_create_depth(
		0,
		0,
		get_layer_depth(LAYER.ui)-100,
		fadeOut);
	alarm[0] = room_speed;
}