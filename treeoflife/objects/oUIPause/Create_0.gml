/// @description initialise options
//global.options = ds_list_create();
	
visible = false;
col_msg = c_white;
defender_cost = 20;
selection = 0;
soil_instance = 0;

hide = function() {
	visible = false;
}

show = function() {
	selection = 0;
	visible = true;
	//soil_instance = _instance;
	//if global.water_amount >= defender_cost 
	//	col_msg = c_white;
	//else
	//	col_msg = c_red;
}

isOpen = function() {
	return visible;
}
