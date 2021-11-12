enum upgradeMenu {
	close,
	heal,
	addHp,
	addDamage,
}

function PanelDefenderDrawUpgrade(){
	if (debugger_mode) show_debug_message("Drawing in PanelDefenderDrawUpgrade now");
	
	with(oUIPanelRight) {
		panelTitle = "Upgrade";
		var defender = originInstance.defenderId;
		if (instance_exists(defender) && defender != 0) {
			icon = defender.object_index.sprite_index;
		}
	}
	
	buttons = array_create();
	buttonNames = array_create();
	
	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	healButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	upgradeHpButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	upgradeDamageButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	buttons[upgradeMenu.close]	= closeButton;
	buttons[upgradeMenu.heal]	= healButton;
	buttons[upgradeMenu.addHp]	= upgradeHpButton;
	buttons[upgradeMenu.addDamage]		= upgradeDamageButton;
	
	buttonNames[upgradeMenu.close]	= "Close";
	buttonNames[upgradeMenu.heal]	= "Heal (2)";
	buttonNames[upgradeMenu.addHp]	= "Tank up (10)";
	buttonNames[upgradeMenu.addDamage]		= "Damage up (5)";
	
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