enum orderedButtonMenu {
	cactus,
	fern,
	degrow,
	close,
}

function PanelDefenderDraw(){
	if (debugger_mode) show_debug_message("Drawing in PanelDefenderDraw now");
	buttons = array_create(4);
	buttonNames = array_create(4);
	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	cactusButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	fernButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	degrowButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	buttons[orderedButtonMenu.close]	= closeButton;
	buttons[orderedButtonMenu.cactus]	= cactusButton;
	buttons[orderedButtonMenu.fern]		= fernButton;
	buttons[orderedButtonMenu.degrow]	= degrowButton;
	
	buttonNames[orderedButtonMenu.close]	= "Close";
	buttonNames[orderedButtonMenu.cactus]	= "Cactus";
	buttonNames[orderedButtonMenu.fern]		= "Fern";
	buttonNames[orderedButtonMenu.degrow]	= "Degrow";
	
	for (var b = 0; b < array_length(buttons); b++) {
		with(buttons[b]) {
			width = other.width/2;
			height = 50;
			_x = other.x;
			_y = other.y + other.height - other.border * (b+1) - height * (b+2);				
			draw = true;
			outline = false;
			message = other.buttonNames[b];
		}
	}
	
	//with(closeButton) {
	//	width = other.width/2;
	//	height = 50;
	//	_x = other.x;
	//	_y = other.y + other.height - other.border - height * 2;				
	//	draw = true;
	//	outline = false;
	//	message = "Close";
	//}
	
	//with(cactusButton) {
	//	width = other.width/2;
	//	height = 50;
	//	_x = other.x;
	//	_y = other.y + other.height - other.border * 2 - height * 3;				
	//	draw = true;
	//	outline = false;
	//	message = "Cactus";
	//}
	
	//with(fernButton) {
	//	width = other.width/2;
	//	height = 50;
	//	_x = other.x;
	//	_y = other.y + other.height - other.border * 3 - height * 4;				
	//	draw = true;
	//	outline = false;
	//	message = "Fern";
	//}
	
	//with(degrowButton) {
	//	width = other.width/2;
	//	height = 50;
	//	_x = other.x;
	//	_y = other.y + other.height - other.border * 4 - height * 5;				
	//	draw = true;
	//	outline = false;
	//	message = "Degrow";
	//}
	
	state = PanelDefenderOpen;
}