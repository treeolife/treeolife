/// @description 

// Inherit the parent event
event_inherited();

x = window_get_width() / 2 - (200 / 2);
y = 40;
ystart = y;

time = 0;
startTime = 0;
destruct = false;
timesUpCol = c_white;
eventName = "";
postText= "";
show = true;

function selfDestruct() {
	destruct = true;
}