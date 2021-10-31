function NewPanelMiddle(icon, title, message="msg"){
	mp = instance_create_depth(0,0,get_layer_depth(LAYER.ui) - 99,oUIPanelMiddle);
	mp.panelTitle = title;
	mp.message = message;
	mp.icon = icon;
	
	return mp;
}