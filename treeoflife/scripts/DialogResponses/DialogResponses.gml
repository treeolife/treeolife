/// @arg Response
function DialogResponses(argument0) {

	switch(argument0) {
		
		case 0: break;
		case 1: NewTextBox("Do I want to plant the Tree of Life?", TEXTBOX.player, ["0:Not now.","2:Yes."]); break;
		case 2: NewTextBox("Walk up to the dark brown patch.", TEXTBOX.player); break;
		default: break;
	}

}
