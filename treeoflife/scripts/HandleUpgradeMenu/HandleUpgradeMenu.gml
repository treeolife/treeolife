function HandleUpgradeMenu(){
	
	if debugger_mode show_debug_message("Handle Upgrade Menu");
	
		switch(buttonSelected) {
				
			case upgradeMenu.close:
				state = PanelDefenderClose;
				break;
					
			case upgradeMenu.cactus:
				originInstance.defenderId.hp_max += 100;
				originInstance.defenderId.hp += 100;
				state = PanelDefenderClose;
				break;
					
			case upgradeMenu.fern:
				originInstance.defenderId.damage += 1;
				state = PanelDefenderClose;
				break;
					
			default:
				break;
		}
	}
	state = PanelDefenderOpen;