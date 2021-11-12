enum orderedButtonMenu {
	close,
	cactus,
	fern,
}

function PanelDefenderDraw(){
	if (debugger_mode) show_debug_message("Drawing in PanelDefenderDraw now");
	
	buttons = array_create();
	buttonNames = array_create();
	
	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	cactusButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	if (global.wave > 1)
		fernButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	buttons[orderedButtonMenu.close]	= closeButton;
	buttons[orderedButtonMenu.cactus]	= cactusButton;
	
	if (global.wave > 1)
		buttons[orderedButtonMenu.fern]		= fernButton;
	
	buttonNames[orderedButtonMenu.close]	= "Close";
	buttonNames[orderedButtonMenu.cactus]	= "Cactus";
	
	if (global.wave > 1)
		buttonNames[orderedButtonMenu.fern]		= "Fern";
	
	for (var b = 0; b < array_length(buttons); b++) {
		with(buttons[b]) {
			width = other.width/2;
			height = 50;
			_x = other.x;
			_y = other.y + other.height - other.border * ((array_length(other.buttons) - b)) 
										- height * ((array_length(other.buttons) - b)+1);				
			draw = true;
			outline = false;
			message = other.buttonNames[b];
		}
	}
	
	action = HandleDrawMenu;
	state = PanelDefenderOpen;
}