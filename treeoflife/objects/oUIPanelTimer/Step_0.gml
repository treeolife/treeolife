/// @description 

// Inherit the parent event
event_inherited();

if (destruct) {
	image_alpha -= (image_alpha + 0.8) / room_speed;
	y -= (250 - y) / room_speed;
	if (image_alpha < 0 && y < -200) instance_destroy();
}