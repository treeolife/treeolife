/// @description initialise options
global.options = ds_list_create();
	
ds_list_add(global.options, sCactus);
ds_list_add(global.options, sCactus);
ds_list_add(global.options, sCactus);
	
showGUI = false;
visible = false;

selection = 0;

hide = function() {
	visible = false;
}

show = function() {
	visible = true;
}

isOpen = function() {
	return visible;
}