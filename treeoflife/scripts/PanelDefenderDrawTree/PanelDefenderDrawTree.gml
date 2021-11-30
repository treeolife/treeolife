enum treeMenu {
	close,
	tree,
}

function PanelDefenderDrawTree(){
	if (debugger_mode) show_debug_message("Drawing in PanelDefenderDrawTree now");
	
	with(oUIPanelRight) {
		panelTitle = "Tree of Life";
		panelIndex = 1;
		var defender = originInstance.defenderId;
		if (instance_exists(defender) && defender != 0) {
			icon = defender.object_index.sprite_index;
		}
	}
	
	buttons = array_create();
	buttonNames = array_create();

	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	treeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	buttons[treeMenu.close]	= closeButton;
	buttons[treeMenu.tree]	= treeButton;
	
	buttonNames[treeMenu.close]	= "Close";
	
	if (global.wave == 0 && not instance_exists(oTree))
		buttonNames[treeMenu.tree]	= "Plant Seed";
	else
		buttonNames[treeMenu.tree]	= "Next Level";
		
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