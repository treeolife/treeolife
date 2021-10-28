/// @description skip exposition
if (!(instance_exists(fadeIn) && instance_exists(fadeOut))) {
	instance_create_depth(
		0,
		0,
		get_layer_depth(LAYER.ui)-100,
		fadeOut);
	alarm[1] = room_speed;
}