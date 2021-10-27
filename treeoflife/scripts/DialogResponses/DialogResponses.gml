/// @arg Response
function DialogResponses(argument0) {

	switch(argument0) {
		
		case 0: break;
		case 1: NewTextBox("Do you want to plant the Tree of Life?", TEXTBOX.player, ["2:Yes.","0:Not now."]); break;
		case 2: NewTextBox("Walk up to, and interact with the dark brown patch.", TEXTBOX.select); break;
		default: break;
	}

}
