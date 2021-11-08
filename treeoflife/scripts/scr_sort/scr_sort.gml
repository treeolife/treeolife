///scr_sort(list, instances)
function scr_sort(list) {
	var tempList = ds_list_create(); //creating a temporary list
	
	with(pItem) {
		if (pItem.picked) {
			ds_list_add(tempList,id);
		}
	}
	
	//Here we find the minimum health of a player and put it in our actual list
	//and remove it from our temporary list. We do this until there are no more
	//players in the temporary list, and there we go, that's one way to sort it.
	while (ds_list_size(tempList) > 0)
	{
	    var obj = ds_list_find_value(tempList,0);
	    var index;
    
	    for (var i=0;i<ds_list_size(tempList);++i)
	    {
	        var compare = ds_list_find_value(tempList,i);
        
	        if (compare.object_index <= obj.object_index)
	        {
	            obj = compare;
	            index = i;
	        }
	    }
    
	    ds_list_add(list,obj);
	    ds_list_delete(tempList,index);
	}

	ds_list_destroy(tempList); //we destroy the temporary list so it doesn't cause a memory leak
	return list;
}