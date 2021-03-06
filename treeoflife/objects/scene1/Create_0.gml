NewTextBox(
	"Earth, Year 2100." +
	"\nHuman pollution is out of control."
	, TEXTBOX.empty);
NewTextBox(
	"In pursuit of economic and technological progress, the humans " +
	"\nhave forgotten the fragility of what gives them their home:" + 
	"\n...the Earth."
	, TEXTBOX.defender);
NewTextBox(
	"Factories, power plants pump pollutants into the air. " +
	"\nChemical wastes dumped into the sea, untreated. The land," + 
	"\nlittered with metal and plastic."
	, TEXTBOX.defender);
NewTextBox(
	"It was a horrible sight."
	, TEXTBOX.defender);
	
gui_width	= display_get_gui_width();
gui_height	= display_get_gui_height();
gui_margin	= 32;

help_text		= "Press ENTER to advance story.\nAgain to fast forward.\nESC to skip.";
//control_text	= "Use up, down keys, and ENTER to select";
menu_help_font	= fDebug;
menu_help_itemheight = font_get_size(menu_help_font);
menu_fade		= 0;
