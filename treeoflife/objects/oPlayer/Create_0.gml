/// @description initialise

enum MIDORI {
	idle	= 0,
	sprint	= 1,
}

// Instance timer
instance_create_depth(0,0,0, oTimer);

speed_v = 0;
speed_h = 0;
positionX = 0;
positionY = 0;

#region Current settings
max_speed = 3.5;
game_gravity = 0.4;
acceleration = 0.3;
game_friction = 0.1;
jump_height = -7;
#endregion

j = 0;
state = PlayerStateIdle;
midoriState = MIDORI.idle;

startTimer = function(time_in_seconds) {
	global.currentTime = real(time_in_seconds);
	global.timer = real(time_in_seconds);
}
