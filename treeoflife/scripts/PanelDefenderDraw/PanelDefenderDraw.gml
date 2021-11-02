function PanelDefenderDraw(){
	show_debug_message("Drawing in PanelDefenderDraw now");
	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
	
	with(closeButton) {
		width = other.width/2;
		height = 300;
		_x = other.x;
		_y = other.y + other.height - other.border - height * 2;				
		draw = true;
		message = "Close";
	}
	
	state = PanelDefenderOpen;
}