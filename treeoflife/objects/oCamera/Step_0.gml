/// @description 

if (initialised == false) {
	switch(global.wave) {
		case 0:
		default: 
			factor = 0.5;
			original_width = 1366*factor; original_height = 768*factor;
			zoom = 0.5; target_zoom = 0.625;
			initialised = true;
			break;
		case 1:
			factor = 0.625;
			original_width = 1366*factor; original_height = 768*factor;
			zoom = 0.625; target_zoom = 1.0;
			initialised = true;
			break;
		case 2:
			factor = 0.77;
			original_width = 1366*factor; original_height = 768*factor;
			zoom = 0.77; target_zoom = 1.0;
			initialised = true;
			break;
		case 3:
			factor = 0.9;
			original_width = 1366*factor; original_height = 768*factor;
			zoom = 0.9; target_zoom = 1.0;
			initialised = true;
			break;
		case 4:
			factor = 1.0;
			original_width = 1366*factor; original_height = 768*factor;
			zoom = 0.9; target_zoom = 1.0;
			initialised = true;
			break;
	}
}

if(oPlayer.y == prev_oPlayer_y) zoom += (target_zoom - zoom) * zoom_speed; else prev_oPlayer_y = oPlayer.y; // zoom out after spawn
camera_set_view_size(cam,original_width*zoom,original_height*zoom);
scr_camera_follow(getFollow(),original_width*zoom, original_height*zoom, cam_speed);