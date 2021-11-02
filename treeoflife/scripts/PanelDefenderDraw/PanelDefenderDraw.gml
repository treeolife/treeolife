function PanelDefenderDraw(){
	show_debug_message("Drawing in PanelDefenderDraw now");
	closeButton = instance_create_depth(x, y, get_layer_depth(LAYER.ui)-200, oButton);
		with(closeButton) {
			//if (other.title != noone && other.originInstance != noone) {
				x = other.x;
				y = other.y + other.height - other.border - 45;
				width = other.width/2;
				height = 45;
				draw = true;
				message = "Close";
			//}
	}
	
	state = PanelDefenderOpen;
}