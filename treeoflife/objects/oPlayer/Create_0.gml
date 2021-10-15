/// @description initialise

speed_v = 0;
speed_h = 0;
#region Legacy settings
	#region Speedier settings, works well
	//max_speed = 4;
	//game_gravity = 1;
	//acceleration = 0.3;
	//game_friction = 0.2;
	//jump_height = -11;
	#endregion
	#region Original settings, works well
	//max_speed = 3.5;
	//game_gravity = 1;
	//acceleration = 0.3;
	//game_friction = 0.1;
	//jump_height = -11;
	#endregion
#endregion
#region Original settings from Shaun Spalding
// Shaun spaulding
//max_speed = 3.5;
//game_gravity = 0.4;
//acceleration = 0.3;
//game_friction = 0.1;
//jump_height = -7;
#endregion
#region Current settings
max_speed = 3.5;
game_gravity = 0.7;
acceleration = 0.3;
game_friction = 0.1;
jump_height = -7;
#endregion

state = PlayerStateIdle