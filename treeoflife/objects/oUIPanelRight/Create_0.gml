/// @description 

// Inherit the parent event
event_inherited();

var border = 18;
var adjWidth = 200;
var title = "Planting the tree";

//instance_create_depth(
//		window_get_width()-border/2-adjWidth/2-10,
//		border*2 + 56,
//		get_layer_depth(LAYER.ui)-100,
//		oUIPanelHighlight);
		
title = NewHighlight(
	sSeed,
	window_get_width()-border/2-adjWidth/2-10,
	border*2 + 56,
	adjWidth,
	title);