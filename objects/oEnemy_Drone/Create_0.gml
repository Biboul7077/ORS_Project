// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprIdle		= sEnemyDrone_Idle;
sprMove		= sEnemyDrone_Move;
sprDie		= sEnemyDrone_Die;
sprHurt		= sEnemyDrone_Hurt;

//Enemy Scripts
enemyScripts[ENEMYSTATE.WANDER]	= DroneWander;
enemyScripts[ENEMYSTATE.CHASE]	= DroneChase;
enemyScripts[ENEMYSTATE.HURT]	= DroneHurt;
enemyScripts[ENEMYSTATE.DIE]	= DroneDie;