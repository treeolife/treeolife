/// @description 

oFollow = oPlayer;
cam = view_camera[0]
cam_speed = 4;
cam_width = camera_get_view_width(cam);
cam_height = camera_get_view_height(cam);

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
