if(delta < duration) { // calculate alpha based on duration
    delta++;
    alpha = (((delta / duration) / 1) * 1);
} else if(delayDelta < delay){ // wait for delay to end
    delayDelta++;
} else {
    //end of transition event goes here    
    room_goto_next();
	instance_destroy(id);
}