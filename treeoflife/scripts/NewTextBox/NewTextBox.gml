enum TEXTBOX {
	defender= 0,
	entity	= 1,
	player	= 2,
	select	= 3,
	empty	= 4,
}

function NewTextBox() {
	global.Dialog = true;
	
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with (instance_create_depth(x,y,get_layer_depth(LAYER.ui),_obj)) {
		message = argument[0];
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
	}

	with (oPlayer) {
		if (state != PlayerStateLocked) {
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}
