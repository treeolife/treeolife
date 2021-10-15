/// @description user input

if (keyboard_check_pressed(vk_enter)) {
	selection = 0;
	if (!showGUI) {
		show();
		showGUI = true;
	} else {
		hide();
		showGUI = false;
	}
}

var options_size = ds_list_size(global.options);

if (keyboard_check_pressed(vk_up)) {
	selection = 0;
	ds_list_add(global.options, sCactus);
}

if (keyboard_check_pressed(vk_down)) {
	selection = 0;
	ds_list_delete(global.options, options_size - 1);
}

if (keyboard_check_pressed(ord("A"))) {
	if selection > 0
		selection -= 1;
}

if (keyboard_check_pressed(ord("D"))) {
	if selection < options_size - 1
	selection += 1;
}