function NewHighlight(
	icon, _x, _y, width, _message, 
	animate=false, flex=false, highlight=false)
{
	h = instance_create_depth(
		0,
		0,
		get_layer_depth(LAYER.ui)-300,
		oUIPanelHighlight);
	
	h.highlight = highlight;
	h.flex = flex;
	h.animate = animate;
	h.setWidth(width);
	h.icon = icon;
	h.y	= _y;
	h.x = _x;
	h.message = _message;
	
	return h;
}