/// @description 

// Inherit the parent event
event_inherited();

if string_length(panelTitle) > 0 && title == noone {
	title = NewHighlight(
		icon,
		x-3,
		border*2,
		width,
		panelTitle);
}