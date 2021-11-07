/// @description 

// Inherit the parent event
event_inherited();

image_speed = 0;

panelIndex = 0;

icon = sSeed;
border = 18;
panelTitle = "";

originInstance = noone;

title = noone;
fullPanelMarginBottom = 120;
fullPanelMarginTop = border + 38;

width = 200;
height = window_get_height() - border * 2 - fullPanelMarginTop - fullPanelMarginBottom;

state = PanelDefenderOpen;
action = noone;

buttons = array_create(0);
buttonSelected = 0;
buttonsDrawn = false;

x = window_get_width() + width;