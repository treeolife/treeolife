/// @description 

with(other) {
	if (instance_exists(id) && not id.object_index == oTree)
		other.currentTarget = id;	
}