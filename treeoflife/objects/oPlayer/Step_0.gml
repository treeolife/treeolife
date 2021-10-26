/// @description state machine

keyLeft	=	keyboard_check(vk_left);
keyRight =	keyboard_check(vk_right);
keySpace =	keyboard_check_pressed(vk_space);
keyPlant =	keyboard_check_pressed(ord("Z"));
keyPause =	keyboard_check_pressed(vk_escape);

// Apply horizontal movement on player input
player_input =  keyRight - keyLeft;

// Position
positionX = x;
positionY = y;

// Starts script PlayerStateIdle, found in oPlayer's Create section
script_execute(state);
