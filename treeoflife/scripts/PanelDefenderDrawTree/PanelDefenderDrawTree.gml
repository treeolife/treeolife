enum treeMenu {
	tree,
	close,
}

function PanelDefenderDrawTree(){
	if (debugger_mode) show_debug_message("Drawing in PanelDefenderDrawTree now");
	
	buttons = array_create(2);
	buttonNames = array_create(2);

	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	treeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	buttons[treeMenu.close]	= closeButton;
	buttons[treeMenu.tree]		= treeButton;
	
	buttonNames[treeMenu.close]	= "Close";
	buttonNames[treeMenu.tree]		= "Tree of Life";
	
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
	
	action = HandleTreeMenu;
	state = PanelDefenderOpen;
}