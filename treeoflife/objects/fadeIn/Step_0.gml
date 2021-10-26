if(delayDelta < delay){ // wait for delay to end
    delayDelta++;
} else if(delta < duration) { // calculate alpha based on duration
    delta++;
    alpha = 1 - (((delta / duration) / 1) * 1);
} else {
    //end of transition event goes here    
    instance_destroy(id);
}