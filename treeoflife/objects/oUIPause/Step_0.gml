/// @description user input

var options_size = ds_list_size(global.options);

if (keyboard_check_pressed(vk_left)) {
	if (selection > 0) && isOpen()
		selection -= 1;
}

if (keyboard_check_pressed(vk_right)) {
	if (selection < options_size - 1) && isOpen()
	selection += 1;
}

if (keyboard_check_pressed(vk_enter)) {
	if (isOpen()) {
		if(soil_instance.createDefender(oCactus) == -1) col_msg = c_red;
			hide();
	}
}

if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Z"))) {
	if (isOpen())
		hide();
}