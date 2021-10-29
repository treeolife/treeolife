/// @description 

if (menu_fade > 1) menu_fade = 1;
else menu_fade += 0.005;	

if (!global.Dialog && destinationRoom != noone) {
	fade = instance_create_depth(
		0,
		0,
		get_layer_depth(LAYER.ui)-100,
		fadeOut);
	fade.destination = destinationRoom;
}