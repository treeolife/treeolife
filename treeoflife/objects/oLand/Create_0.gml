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
	idle: new State(sLandIdle),
	walk: new State(sLandWalk),
	attack: new State(sLandIdle),
	aggro: new State(sLandWalk),
	flinch: new State(sLandFlinch),
	die: new State(sLandDie),
}

function statePollutionInit() {
	//states.attack.StateOnEnd(states.idle);
	//states.aggro.StateOnEnd(states.attack);
	//states.aggro.StateOnEnd(states.walk);
	//states.walk.StateOnEnd(states.idle);
	states.idle.StateOnEnd(states.aggro);
	states.idle.StateOnEnd(states.walk);
	//test
	states.aggro.StateOnEnd(states.idle);
	//states.idle.StateOnEnd(states.flinch);
	//states.flinch.StateOnEnd(states.die);
	//states.flinch.StateOnEnd(states.aggro);
}

statePollutionInit();

// Initial state
state = states.idle; 