/// @description 
if (animate && global.panelState.highlight > 0) {
	var nonAnimatedHighlights = 0;
	for (var nPanel = 0; nPanel < instance_number(oUIPanelHighlight); nPanel++) {
		n = instance_find(oUIPanelHighlight, nPanel);
		if (n != noone && n.animate == false) {
			nonAnimatedHighlights++;
		}
	}
	
	if debugger_mode
		show_debug_message("Num of highlights: " + 
			(instance_number(oUIPanelHighlight) - nonAnimatedHighlights));
			
	if ((instance_number(oUIPanelHighlight) - nonAnimatedHighlights) == 1)
				global.panelState.highlight = 0;	
	
}