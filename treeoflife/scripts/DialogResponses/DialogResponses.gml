/// @arg Response
function DialogResponses(argument0) {

	switch(argument0) {
		
		case 0: break;
		case 1: NewHighlight(sKeyArrows,window_get_width()/2,0,100,"Use arrow keys for options!",true, true, true);
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
		case 13: NewHighlight(sKeyEsc, window_get_width()/2,0,100,
			"Press ESC to pause the game.",true,true,true); break;
		case 14: instance_create_depth(x,y,depth,oWater); break;
		case 15: instance_create_depth(x,y,depth,oFertiliser); break;
		case 16: global.timeToLevel.start(); break;
		case 17: {
			NewHighlight(sSeed,window_get_width()/2,0,100,"Pollution eradicated, Nature has won!",true, true, true); break;
			NewTextBox("Rejoice, like the child in you.", TEXTBOX.defender, ["18:"]);
			} break;
		case 18: TransitionRoom(rCredits, "Congrats!"); break;
		
		default: break;
	}

}
