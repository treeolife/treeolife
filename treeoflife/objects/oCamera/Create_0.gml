/// @description 

oFollow = oPlayer;
cam = view_camera[0]
cam_speed = 4;

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