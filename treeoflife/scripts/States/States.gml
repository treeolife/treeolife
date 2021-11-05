// GameMakerStation - Matharoo, State Machines
function State(_sprite) constructor {
	sprite = _sprite;
	
	stateOnEnd = undefined;
	static StateOnEnd = function (_state) { // method name caps, differentiate from atr
		stateOnEnd = _state;
	}
}

function state_set(_state) {
	if (state == _state) return;
	state = _state;
	
	// this is somewhat an enter script
	sprite_index = state.sprite;
	image_index = 0;
}

function state_set_aggro(_state) {
	state_set(_state);
	
	var _hitbox = instance_create_depth(x,y,depth,oHitbox);
	_hitbox.sprite_index = sprite_index;
	_hitbox.image_xscale = image_xscale;
	
	target(oTree.defenderArea);
}