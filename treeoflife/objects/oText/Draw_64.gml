var longerResponses = (responses[0] != -1) && array_length(responses) > 2;
var additionalHeight = 0;

if longerResponses {
	
	addedHeight = y1 - 
		font_get_size(fDialogText) * (array_length(responses) - 2);
	
	draw_sprite_stretched(
		sTextBoxBg,
		background,
		x1,
		addedHeight,
		x2-x1,
		y2-addedHeight);
} else
	draw_sprite_stretched(sTextBoxBg,background,x1,y1,x2-x1,y2-y1);
draw_set_font(fDialogText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _print = string_copy(message,1,textProgress)

//Add responses
if (responses[0] != -1) && (textProgress >= string_length(message)) {
	for (var i = 0; i < array_length(responses); i++) {
		var response = responses[i];
		var responseLength = string_length(response);
		_print += "\n";
		if (i == responseSelected && responseLength > 0) _print += "> ";
		_print += response;
		if (i == responseSelected && responseLength > 0) _print += " <";
	}
}

if longerResponses {
	draw_text((x1+x2) /2,addedHeight+8,_print);
	draw_set_color(c_white);
	draw_text((x1+x2) /2,addedHeight+7,_print);
} else {
	draw_text((x1+x2) /2,y1+8,_print);
	draw_set_color(c_white);
	draw_text((x1+x2) /2,y1+7,_print);	
}