/// @description 

// Inherit the parent event
event_inherited();

attacked = false;
attackedBy = 0;
damage = 0.5;

// Behaviour
attackDefender = true;

// Initialise states
states = {
	idle: new State(sLandIdle, "Idle"),
	walk: new State(sLandWalk, "Walk"),
	attack: new State(sLandIdle, "Attack"),
	aggro: new State(sLandWalk, "Aggro"),
	flinch: new State(sLandFlinch, "Flinch"),
	die: new State(sLandDie, "Die"),
}

function stateDecisionInit() {
	//states.attack.StateOnEnd(states.idle);
	//states.aggro.StateOnEnd(states.attack);
	//states.aggro.StateOnEnd(states.walk);
	//states.walk.StateOnEnd(states.idle);
	states.idle.StateOnEnd(states.idle);
	//states.idle.StateOnEnd(states.aggro);
	//test
	states.aggro.StateOnEnd(states.idle);
	//states.idle.StateOnEnd(states.flinch);
	//states.flinch.StateOnEnd(states.die);
	states.flinch.StateOnEnd(states.aggro);
}

stateDecisionInit();

// Initial state
state			= states.idle; 
state_previous	= -1;
state_next		= -1;
state_time		= -1;
