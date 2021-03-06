/// @function scr_follow_the_path(number_of_points)
/// @param {var} number_of_points Number of points
function scr_follow_the_path(nPath) {
	var path_direction;
	path_direction = sign(path_get_point_x(nPath, path_point+1)-path_get_point_x(nPath, path_point)) ;
	var _max_speed = max_speed;
	var _jump_height = jump_height;
	
	
	// TODO bad handling of direction sprite
	if path_direction > 0 {
		face_direction = -1;
		//max_speed *= 1.2;
		//jump_height *= 1.2;
	}
	else if path_direction < 0 {
		face_direction = 1;
	}
		
	if action == 0
	{
	    /// Check if the next point is to move left or right
	    if path_get_point_y(nPath, path_point) == path_get_point_y(nPath, path_point+1) && path_get_point_x(nPath, path_point) + (oGrid.cell_width)*path_direction == path_get_point_x(nPath, path_point+1)
	    {
	    speed_h = max_speed * path_direction * movement_speed;
	    action = 1;
	    }
	     else {
	            /// Check if the next point is horizontal jump / jump over a void.
	            if path_get_point_y(nPath, path_point) == path_get_point_y(nPath, path_point+1) && path_get_point_x(nPath, path_point) + 2*oGrid.cell_width*path_direction == path_get_point_x(nPath, path_point+1)
				/// Check top 3 tiles for horizontal jump over / over a void is empty.
				/// TODO
	            {
	            speed_h = max_speed * path_direction * 0.7;
	            speed_v = jump_height * 0.7; // 0.7 Too fast may fall off short platforms
	            action = 1;
	            }
				/// Check if the next point is big horizontal jump.
	            if path_get_point_y(nPath, path_point) == path_get_point_y(nPath, path_point+1) && path_get_point_x(nPath, path_point) + 3*oGrid.cell_width*path_direction == path_get_point_x(nPath, path_point+1)
				/// Check top 4 tiles for big horizontal jump are empty.
				//&& checkAboveClearanceTiles(path_get_point_x(nPath, path_point+1), path_get_point_y(nPath, path_point+1), path_direction, 4)
	            {
	            speed_h = max_speed * path_direction ;
	            speed_v = jump_height *0.9 ;
	            action = 1;
	            }
	                else {
	                    /// Check if the next point is to fall
	                    if path_get_point_y(nPath, path_point) < path_get_point_y(nPath, path_point+1)
	                    {
	                    speed_h = max_speed * path_direction * movement_speed;
	                        if x <= path_get_point_x(nPath, path_point+1) && path_get_point_x(nPath, path_point+1) <(x + speed_h*path_direction)
	                        {
	                        action = 1 ;
	                        speed_h = 0 ;
	                        x = path_get_point_x(nPath, path_point+1);
	                        }
	                    }
	                        else {
	                                /// Check if the next point is a diagonal jump / big jump
	                                if path_get_point_x(nPath, path_point) == path_get_point_x(nPath, path_point+1)-oGrid.cell_width*2*path_direction && path_get_point_y(nPath, path_point) == path_get_point_y(nPath, path_point+1)+oGrid.cell_height
	                                {
	                                speed_h = max_speed * path_direction * 0.75 ; // 0.625 was too slow
	                                speed_v = jump_height * 0.9 ;
	                                action = 1;
	                                }
	                                    else {
	                                            /// Check if the next point is a jump one block vertically
	                                            if path_get_point_y(nPath, path_point) == path_get_point_y(nPath, path_point+1)+oGrid.cell_height && path_get_point_x(nPath, path_point) + oGrid.cell_width*path_direction == path_get_point_x(nPath, path_point+1)
	                                            {
	                                            speed_h = max_speed * (path_direction / 2);
	                                                if place_meeting(x, y+1, oCollision) && jump_action == 0
	                                                {
	                                                speed_v = jump_height * 0.9 ;
	                                                jump_action = 1 ;
	                                                speed_h = max_speed * path_direction * 0.5;
	                                                }
	                                }
	                            }
	                        }
	                    }
	        }
	}

	// reset speed after adjusting for right slow speed bias
	max_speed = _max_speed;
	jump_height = _jump_height;

	/// Check if enemy reached the next point
	scr_arrived(nPath);
}

function scr_arrived(nPath) {
	var path_direction = sign(path_get_point_x(nPath, path_point+1)-path_get_point_x(nPath, path_point));
	var number_of_points = path_get_number(nPath);
	if x <= path_get_point_x(nPath, path_point+1) && path_get_point_x(nPath, path_point+1) <= x + speed_h*path_direction && path_get_point_y(nPath, path_point+1)== y - sprite_yoffset - (oGrid.cell_height/2 - sprite_height)
	    {
	    path_point = path_point + 1 ;
	    action = 0 ;
	    jump_action = 0 ;
	        if path_point == number_of_points -1  /// Check if it is the last point of the path
	            {
	            speed_h = 0;
	            speed_v = 0;
	            path_delete (nPath);
	            path_point = 0 ;
				
				return true;
	            }
	    }
	return false;
}