/// @description 

// Inherit the parent event
event_inherited();

if (title == noone && icon != noone && string_length(panelTitle) > 0) 
	title = NewHighlight(
				icon,
				window_get_width() - (width/2 + border) - 1,
				fullPanelMarginTop + 4*border/2,
				width,
				panelTitle);    