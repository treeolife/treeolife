/// @arg Response
function DialogResponses(argument0) {

	switch(argument0) {
		
		case 0: break;
		case 1: NewTextBox("Do I want to plant the Tree of Life?", TEXTBOX.player, ["0:Not now.","2:Yes."]); break;
		case 2: NewTextBox("Walk up to the dark brown patch.", TEXTBOX.player); break;
		case 3: instance_create_depth(0,0,get_layer_depth(LAYER.ui), oUIPanelRight); break;
		case 4: TransitionRoom(rHidden); break;
		case 5: TransitionRoom(rZero); break;
		case 6: instance_destroy(oUIPanelRight); break;
		case 7: instance_create_depth(0,0,get_layer_depth(LAYER.ui), oUIPanelHighlight); break;
		case 8: instance_create_depth(0,0,get_layer_depth(LAYER.ui), oUIPanelMiddle); break;
		case 9: instance_destroy(oUIPanelHighlight); break;
		case 10: instance_destroy(oUIPanelMiddle); break;
		case 11: instance_create_depth(x,y,depth,oSeed);
		default: break;
	}

}
