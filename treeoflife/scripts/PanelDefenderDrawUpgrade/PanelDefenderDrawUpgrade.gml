enum upgradeMenu {
	cactus,
	fern,
	close,
}

function PanelDefenderDrawUpgrade(){
	if (debugger_mode) show_debug_message("Drawing in PanelDefenderDrawUpgrade now");
	
	buttons = array_create(3);
	buttonNames = array_create(3);
	
	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	cactusButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	fernButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	buttons[upgradeMenu.close]	= closeButton;
	buttons[upgradeMenu.cactus]	= cactusButton;
	buttons[upgradeMenu.fern]		= fernButton;
	
	buttonNames[upgradeMenu.close]	= "Close";
	buttonNames[upgradeMenu.cactus]	= "Upgrade Cactus";
	buttonNames[upgradeMenu.fern]		= "Upgrade Fern";
	
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
	
	action = HandleUpgradeMenu;
	state = PanelDefenderOpen;
}