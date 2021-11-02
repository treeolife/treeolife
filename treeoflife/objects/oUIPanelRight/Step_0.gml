/// @description 

// Inherit the parent event
event_inherited();

if (title == noone && icon != noone && string_length(panelTitle) > 0) { 
	title = NewHighlight(
				icon,
				x + width/2 - 1,
				fullPanelMarginTop + 4*border/2,
				width,
				panelTitle);
}
				
if (title != noone && originInstance != noone ) {
	xTarget = window_get_width() - width - border;
	y = border + fullPanelMarginTop;
	script_execute(state);
}