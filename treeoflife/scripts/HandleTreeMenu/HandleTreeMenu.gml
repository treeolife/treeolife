function HandleTreeMenu(){
	
	show_debug_message("Handle Tree Menu");
	
			
		switch(buttonSelected) {
				
			case treeMenu.tree:
				originInstance.createDefender(oTree);
				state = PanelDefenderClose;
				break;
				
			case treeMenu.close:
				state = PanelDefenderClose;
				break;

			default:
				break;
		}
	}
	state = PanelDefenderOpen;