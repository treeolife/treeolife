#macro TRUESTATE_STEP 0
#macro TRUESTATE_DRAW 1
#macro TRUESTATE_NEW 2
#macro TRUESTATE_FINAL 3
#macro TRUESTATE_QUEUE 9999 

#region --SYSTEM---------------------------------------------
/// @func truestate_system_init
function truestate_system_init() {

	truestate_step_queue = ds_priority_create()
	truestate_draw_queue = ds_priority_create()
  truestate_temp_queue = ds_priority_create();
	truestate_list = ds_list_create();
}	

///@func truestate_create_layer()
function truestate_create_layer() {	
	var _inst = {
		current_state  : noone,
		default_state  : noone,
		previous_state : noone,
		next_state     : noone,
		state_script   : noone,

		switch_locked  : false,
		stack_locked   : false,
		reset_state    : false,
		in_queue       : false,

		map   : ds_map_create(),
		names : ds_map_create(),
		vars  : ds_map_create(), //Useful for storing variables specific to a specific state
		stack : ds_stack_create(),
		queue : ds_queue_create(),

		timer : 0,
		
    /// @func has_states
    has_states: function() {
      return ds_map_size(map) != 0;
    },
    
		/// @func set_default(state_id)
		set_default: function (_id) {
			/// Sets the default/first state for the object.  Called only in the create event, typically after you've defined
			/// all the states for this object.
      if(current_state == _id) return;
			current_state = _id;
			state_script = map[? _id];    

			default_state = current_state;
			next_state = current_state;
			ds_stack_push(stack,current_state);
			with(other) script_execute(other.state_script,TRUESTATE_NEW, other);
		},
		
		///@func state_create(state_id, state_script, *state_name)
		/// @param state_id The unique ID for this state within this object.  An enum, macro, or string.
		/// @param script The script that will handle step and draw for this object.
		/// @param *name Optional name for the state.  Good for drawing out when debugging.
		state_create: function (_id, _script, _name) {
			if(0) return argument[0]; //Removes the IDE warning when allowing optional arguments
	
			map[? _id] = _script;
			names[? _id] = _name != undefined ? _name : "Unnamed";
			if(ds_map_size(map) == 1)
				set_default(_id);
		},
		
		/// @func enqueue(state_id, *state_id...)
		/// Adds any number of states to the queue.
		/// @param state_id The next state to execute
		/// @param *state_id... as many other states as you want.
		enqueue: function () {
	
			var _i=0;
			repeat(argument_count) {
				var _state = argument[_i];
				if(state_exists(_state))
					ds_queue_enqueue(queue,_state);	
				else
					show_debug_message("Tried to queue a non-existent state");
				_i++;
			}
		},

		/// @func queue_start 
		queue_start: function () {
			/// Begins the state queue.
			in_queue = ds_queue_size(queue) > 0;
			state_switch();
		},

		/// @func state_switch(*state_id, *lock)
		/// @param *state_id
		/// @param *lock_switch
		state_switch: function (_id, _lock) {
			if(0) return argument[0]; //Removes the IDE warning when allowing optional arguments
			/// Switches to a new state at the end of this step.
			/// If you lock the state switch, any other state switches will be ignored until this change happens 
			/// the following step.
			/// Finally, if you are in the middle of executing a state queue, any state switch will be
			/// interpreted as a "go to next".  You can call this script with no arguments in that case, or to return to the default state.

			//Queue handling
			if(switch_locked) {
				if(in_queue) {	
					//The locked state will interrupt the queue
					ds_queue_clear(queue);
					in_queue=false;
				}
				exit;
			}
	
			if(in_queue && ds_queue_size(queue)>0) {
				next_state = TRUESTATE_QUEUE;
				exit;
			}
			in_queue = false;

			//Switch to default
			if(_id == undefined) {
				next_state = default_state;
				exit;
			}


			if(ds_map_exists(map,_id)) {
			  next_state = _id;
			}	else {
			  show_debug_message("Tried to switch to a non-existent state("+string(_id)+").  Moving to default state.")
			  next_state = default_state;
			}

			//Push to stack if not locked.
			if(!stack_locked && ds_stack_top(stack) != next_state) 
			  ds_stack_push(stack,next_state);
			else
				stack_locked=false; //Reset the lock on the stack.

			if(_lock != undefined)
			  switch_locked = _lock;
		},

		/// @func switch_previous Returns to the previous state.
		state_switch_previous: function () {
			if(in_queue) {	
				state_switch();
				exit;
			}
			if(ds_stack_empty(stack)) {
				state_switch(default_state);
				exit;
			}

			ds_stack_pop(stack);
			stack_locked = true;
			state_switch(ds_stack_top(stack));
		},
    
    /// @func clear_history()
    clear_history: function() {

      /// Empties the previous state stack to prevent getting to big.
      /// Recommended you call it when you are at a "default" state.

      ds_stack_clear(stack);
      ds_stack_push(stack,current_state);
    },
		
		/// @func draw_history(x, y, count, bg_color,bg_alpha)
		draw_history: function(_title, _x, _y, _count, _bg_color, _bg_alpha) {
			var _str = _title;
			var _stack = ds_stack_create();
			ds_stack_copy(_stack,stack);
			var _lineHeight = string_height(_str);
			_str+="\n\n"
			var _i = 0;
			while(_i < _count && !ds_stack_empty(_stack)) {
				_str += names[? ds_stack_pop(_stack)] +"\n";
				_i++;
			}
			ds_stack_destroy(_stack);
			var _margin = 20;
			draw_set_color(_bg_color);
			draw_set_alpha(_bg_alpha);
			draw_rectangle(_x,_y,	
										 _x+string_width(_str)+_margin*2,
										 _y+_lineHeight*(_count+1)+_margin*3,
										 false);
			draw_set_alpha(1);
			draw_set_halign(fa_left); 
			draw_set_valign(fa_top); 
			draw_set_color(c_white);
			draw_text(_x+_margin,_y+_margin,_str);
		},
		
		
		/// @func state_exists(state_id)
		state_exists: function(_id) {
			return map[? _id] != undefined;	
		}
			
	}
	
	ds_list_add(truestate_list, _inst);
	return _inst;
}


#endregion

#region --Event Functions------------------------------------
/// @func truestate_begin_step
/// Script that executes before all other logic has been performed for the object.
/// Will perform the ACTUAL state switching, and also resets timers.
function truestate_begin_step() {

  for(var _i = 0; _i < ds_list_size(truestate_list); _i++) {
    var _inst = truestate_list[| _i];
    _inst.switch_locked=false; //Release the lock

  	if(_inst.next_state != _inst.current_state || _inst.reset_state) { 
  		//Switch to the new state
      script_execute(_inst.state_script,TRUESTATE_FINAL, _inst);
  	  //script_execute(_inst.state_script,TRUESTATE_FINAL, _inst);
	
  		_inst.previous_state=_inst.current_state;
  		_inst.reset_state=false;
  		if(_inst.next_state == TRUESTATE_QUEUE) {
  			 _inst.next_state=ds_queue_dequeue(_inst.queue);	
  			 ds_stack_push(_inst.stack,_inst.next_state);
  		}
	
  	  _inst.current_state=_inst.next_state;
  	  _inst.state_script=_inst.map[? _inst.current_state];
  	  _inst.timer=0;
  	  //script_execute(_inst.state_script,TRUESTATE_NEW, _inst);
      script_execute(_inst.state_script,TRUESTATE_NEW, _inst);
  	}	else { 
  		//Increment current state timer
  	  _inst.timer++;
  	}
  }
}

/// @func truestate_cleanup
function truestate_cleanup() {
	/// Put in the cleanup event of the object.
	/// Cleans up all related data structures.
  for(var _i = 0; _i < ds_list_size(truestate_list); _i++) {
    var _inst = truestate_list[| _i];
  	script_execute(_inst.state_script,TRUESTATE_FINAL, _inst);
  	ds_map_destroy(_inst.map);
  	ds_map_destroy(_inst.names);
  	ds_map_destroy(_inst.vars);
  	ds_stack_destroy(_inst.stack);
  	ds_queue_destroy(_inst.queue);
  }
  
  ds_priority_destroy(truestate_step_queue);
  ds_priority_destroy(truestate_draw_queue);
  ds_priority_destroy(truestate_temp_queue);
  ds_list_destroy(truestate_list);

}

/// @func truestate_step(layer_id, ...)
function truestate_step() {
	/// Call this in the step event of your object.
   for(var _i = 0; _i < argument_count; _i++) {
     var _layer = argument[_i];
     if(!_layer.has_states()) continue;
     script_execute(_layer.state_script,TRUESTATE_STEP, _layer);
  }
}

/// @func truestate_draw(layer_id, ...)
function truestate_draw() {
	/// Call this in the draw event of your object.
  for(var _i = 0; _i < argument_count; _i++) {
    var _layer = argument[_i];
    if(!_layer.has_states()) continue;
    script_execute(_layer.state_script,TRUESTATE_DRAW, _layer);
  }
  
  //ds_priority_copy( truestate_temp_queue,truestate_draw_queue)
  //while(!ds_priority_empty(truestate_temp_queue)) {
  //  var _inst = ds_priority_delete_min(truestate_temp_queue);
  //  if(script_exists(_inst.state_script)) {
  //    script_execute(_inst.state_script,TRUESTATE_DRAW, _inst)
  //  }
  //}
}


#endregion

#region --Helpers--------------------------------------------
/// @func truestate_clear_history(truestate_id)


/// @func truestate_draw_current(truestate_id, x,y)
function truestate_draw_current(_id, _x, _y) {

	/// Useful debug script that draws the current state name to the screen 
	/// as well as the current state timer value.

	var _str = _id.names[? _id.current_state] + " ("+string(_id.timer)+")";
	draw_text(_x,_y,_str);
}

/// @func truestate_get_name(truestate_id, state_id)
function truestate_get_name(_id, _state_id) {

	/// Returns the string name of the passed state.

	var _name = _id.names[? _state_id];
	return _name == undefined ? "Undefined" : _name;
}

/// @func truestate_reset_current_state(truestate_id)
/// Will repeat the current state as if it had just been switched to for the first time.
function truestate_reset_current_state(_id) {
	_id.reset_state = true;
}

#endregion