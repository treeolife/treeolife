function HandleUpgradeMenu(){
	
	show_debug_message("Handle Upgrade Menu");
	
		switch(buttonSelected) {
				
			case upgradeMenu.close:
				state = PanelDefenderClose;
				break;
					
			case upgradeMenu.cactus:
				originInstance.createDefender(oCactus);
				state = PanelDefenderClose;
				break;
					
			case upgradeMenu.fern:
				originInstance.createDefender(oFern);
				state = PanelDefenderClose;
				break;
					
			default:
				break;
		}
	}
	state = PanelDefenderOpen;