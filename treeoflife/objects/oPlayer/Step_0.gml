/// @description movement, collision

//Input of the player. Horizontal movement
var player_input = keyboard_check(vk_right) - keyboard_check(vk_left) ;
//if player_input != 0
//    {

speed_h = player_input * max_speed;

        //speed_h += player_input * acceleration;
        //speed_h = clamp(speed_h, -max_speed, max_speed);
    //}
        //else
        //{
        //    speed_h = lerp(speed_h, 0, game_friction);
        //}

//Jump input of the player. Vertical movement
if !place_meeting (x, y+1, oCollision)
    {
        speed_v += game_gravity ;
    }
    else    {
                if keyboard_check(vk_space)
                {
                    speed_v = jump_height ;
                }
            }

// Check if there is collision
scr_collision();