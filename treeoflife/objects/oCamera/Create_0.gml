/// @description 

// Temps
prev_oPlayer_y = oPlayer.y;

// Following
oFollow = oPlayer;
cam = view_camera[0]
cam_speed = 4;

// Zoom tween
zoom = 0.1;
target_zoom = 0.5;
zoom_speed = 0.01;

original_width = 1366;
original_height = 768;

factor = 0;
initialised = false;

follow = function(_oFollow) {
	cam_speed = 20;
	previousFollow = oFollow;
	oFollow = _oFollow;
	return;
}

getFollow = function() {
	return oFollow;
}

followPrevious = function() {
	oFollow = previousFollow;
	return;
}

followPlayer = function() {
	cam_speed = 4;
	oFollow = oPlayer;
	return;
}