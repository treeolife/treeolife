function HandleDrawMenu(){
	
	if debugger_mode show_debug_message("Handle Draw Menu");
	
		switch(buttonSelected) {
				
			case orderedButtonMenu.close:
				state = PanelDefenderClose;
				break;
					
			case orderedButtonMenu.cactus:
				originInstance.createDefender(oCactus);
				state = PanelDefenderClose;
				break;
					
			case orderedButtonMenu.fern:
				originInstance.createDefender(oFern);
				state = PanelDefenderClose;
				break;
					
			default:
				break;
		}		
	}
	state = PanelDefenderOpen;