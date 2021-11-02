function NewHighlight(
	icon, _x, _y, width, _message, 
	animate=false, flex=false, highlight=false)
{
	h = instance_create_depth(
		_y,
		_x,
		get_layer_depth(LAYER.ui)-101,
		oUIPanelHighlight);
	
	if (global.panelState.highlight > 0) {
		h.yTarget += (global.panelState.highlight * 40);
	}
	
	if (animate) {
		h.image_alpha = 0;
	}
	
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