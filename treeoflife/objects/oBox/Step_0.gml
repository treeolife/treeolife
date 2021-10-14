/// @description user input

if (keyboard_check_pressed(vk_enter)) {
	switch(showGUI) {
		case true:
			showGUI = false;
			break;
		case false:
			selection = 0;
			showGUI = true;
			break;
		default:
			break;
	}
}

if (keyboard_check_pressed(vk_up)) {
	ds_list_add(global.options, sCactus);
}

if (keyboard_check_pressed(vk_down)) {
	ds_list_delete(global.options, ds_list_size(global.options) - 1);
}

if (keyboard_check_pressed(ord("A"))) {
	selection -= 1;
}

if (keyboard_check_pressed(ord("D"))) {
	selection += 1;
}