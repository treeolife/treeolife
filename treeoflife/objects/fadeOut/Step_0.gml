if(delta < duration) { // calculate alpha based on duration
    delta++;
    alpha = (((delta / duration) / 1) * 1);
} else if(delayDelta < delay){ // wait for delay to end
    delayDelta++;
} else {
    //end of transition event goes here    
    if(destination == noone) room_goto_next();
		else room_goto(destination);
	instance_destroy(id);
}