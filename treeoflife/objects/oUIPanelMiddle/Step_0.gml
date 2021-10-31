/// @description 

// Inherit the parent event
event_inherited();

if (title == noone && icon != noone && string_length(panelTitle) > 0) 
	title = NewHighlight(
				icon,
				x - 3,
				y + border,
				width,
				panelTitle);               