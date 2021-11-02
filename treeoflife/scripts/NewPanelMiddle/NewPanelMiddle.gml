function NewPanelMiddle(icon, title, message="msg", height="228"){
	mp = instance_create_depth(0,0,get_layer_depth(LAYER.ui) - 99,oUIPanelMiddle);
	mp.panelTitle = title;
	mp.message = message;
	mp.icon = icon;
	
	if (height != 228) {
		mp.height = height;
	}
	
	return mp;
}