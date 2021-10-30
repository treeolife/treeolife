/// @description 

// Inherit the parent event
event_inherited();

var sScale = 36;

message = "Testing one two three";

timer = 0;
animate = true;
highlight = true;
icon = sWater;
iconSubimg = 0;
width = 100;
secondsToFade = 15;

if (string_length(message) > 10)
	width = string_length(message) * 8 + sScale * 2;

height = sScale;
offset = sScale / 2;
yTarget = sScale * 5.5;

x = window_get_width() / 2;
y = 0;

image_xscale = width / sprite_width;
image_yscale = height / sprite_height;