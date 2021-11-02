/// @arg Response
function DialogResponses(argument0) {

	switch(argument0) {
		
		case 0: break;
		case 1: NewHighlight(sSignpost,window_get_width()/2,0,100,"Use up and down keys to select dialog options!",true, true, true);
			NewTextBox("Do I want to plant the Tree of Life?", TEXTBOX.select, ["0:Not now.","2:Yes."]); break;
		case 2: NewTextBox("Walk up to the dark brown patch.", TEXTBOX.defender); break;
		//case 3: NewPanelDefender(); break;
		case 4: TransitionRoom(rHidden); break;
		case 5: TransitionRoom(rZero); break;
		case 6: instance_destroy(oUIPanelRight); break;
		case 7: NewHighlight(sSeed,window_get_width()/2,0,100,"Use arrow keys to move!",true, true, true); break;
		case 8: NewPanelMiddle(sSignpost, "Help", "Press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123, press 123."); break;
		case 9: instance_destroy(oUIPanelHighlight); break;
		case 10: instance_destroy(oUIPanelMiddle); break;
		case 11: instance_create_depth(x,y,depth,oSeed); break;
		case 12: global.wave = 1; global.levelAccessed.one = 1; TransitionRoom(rOne); break;
		case 13: NewHighlight(sSignpost, window_get_width()/2,0,100,
			"Press Z to interact with objects in the environment!",true,true,true); break;
		default: break;
	}

}
