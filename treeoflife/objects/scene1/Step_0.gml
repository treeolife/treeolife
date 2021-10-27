/// @description 

if (menu_fade > 1) menu_fade = 1;
else menu_fade += 0.005;	

if (!global.Dialog) {
	instance_create_depth(
		0,
		0,
		get_layer_depth(LAYER.ui)-100,
		fadeOut);
	alarm[0] = room_speed;
}