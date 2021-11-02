function PanelDefenderDraw(){
	show_debug_message("Drawing in PanelDefenderDraw now");
	buttons = array_create(2);
	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	buyButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	buttons[0] = closeButton;
	buttons[1] = buyButton;
	
	with(buyButton) {
		width = other.width/2;
		height = 50;
		_x = other.x;
		_y = other.y + other.height - other.border * 2 - height * 3;				
		draw = true;
		outline = false;
		message = "Buy";
	}
	
	with(closeButton) {
		width = other.width/2;
		height = 50;
		_x = other.x;
		_y = other.y + other.height - other.border - height * 2;				
		draw = true;
		outline = false;
		message = "Close";
	}
	
	state = PanelDefenderOpen;
}