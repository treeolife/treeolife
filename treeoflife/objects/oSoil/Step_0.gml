/// @description 

// Inherit the parent event
event_inherited();

if (defenderId == 0 && ds_map_exists(global.defenders,defenderPosition[0])) {
	loadDefender();
}
