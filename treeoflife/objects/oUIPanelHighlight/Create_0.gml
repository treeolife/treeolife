/// @description 

// Inherit the parent event
event_inherited();

var sScale = 36;

message = "Testing one two three";

justCreated = true;
timer = 0;
flex = true;
animate = true;
highlight = true;
icon = sWater;
iconSubimg = 0;
width = 100;
secondsToFade = 10;
height = sScale;
offset = sScale / 2;
yTarget = sScale * 3.5;

x = window_get_width() / 2;
y = 0;

image_yscale = height / sprite_height;

function setWidth(_width) {
	width = _width;
}