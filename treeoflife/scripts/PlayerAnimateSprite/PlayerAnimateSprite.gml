/// @function PlayerAnimateSprite();
function PlayerAnimateSprite(){
	switch(midoriState) {
		case MIDORI.idle:
		case MIDORI.locked:
			#region animate midori facing direction
			image_speed = 1;
			sprite_index = sMidoriIdle;;
			break;
			#endregion
		case MIDORI.sprint:
			image_speed = 1;
			sprite_index = sMidoriSprint;
			break;
		default:
			break;
	}
	HandlePlayerDirection();
}

function HandlePlayerDirection() {
	if speed_h > 0
		image_xscale = -1;
	else if speed_h < 0
		image_xscale = 1;
}