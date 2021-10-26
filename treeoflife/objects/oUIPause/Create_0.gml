/// @description initialise options
//global.options = ds_list_create();

visible = false;
col_msg = c_white;
selection = 0;

hide = function() {
	oUIBar.visible = true;
	visible = false;
}

show = function() {
	selection = 0;
	oUIBar.visible = false;
	visible = true;
}

isOpen = function() {
	return visible;
 }