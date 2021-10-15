/// @description state machine

keyLeft	=	keyboard_check(vk_left);
keyRight	=	keyboard_check(vk_right);
keySpace =	keyboard_check_pressed(vk_space);

// Apply horizontal movement on player input
player_input =  keyRight - keyLeft;

// Starts script PlayerStateIdle, found in oPlayer's Create section
script_execute(state);