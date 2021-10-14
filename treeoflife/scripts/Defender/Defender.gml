/// @function Defender(name,price,attack,hp,stackSize);
/// @param {type} name			defender name
/// @param {type} price		water cost to grow defender
/// @param {type} attack		value of damage dealt
/// @param {type} hp			amount of hit points
/// @param {type} stackSize	amount in stack
function Defender (name, price, attack, hp, stackSize) constructor {
    this.name			= name;
    this.price			= price;
    this.attackPower	= attack;
	this.hp				= hp;
	this.stackSize		= stackSize;
	this.unlocked		= false;
}
