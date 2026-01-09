// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;
stateTarget			= state;
stateWait			= 0;
stateWaitDuration	= 180;

//Enemy Sprites
sprIdle		= sEnemy_Cargo;
sprMove		= sEnemy_Cargo;
sprDie		= sEnemy_Cargo;
sprHurt		= sEnemy_Cargo;

//Enemy Scripts
enemyScripts[ENEMYSTATE.WANDER]	= CargoWander;
enemyScripts[ENEMYSTATE.CHASE]	= CargoChase;
enemyScripts[ENEMYSTATE.WAIT]	= EnemyWait;
enemyScripts[ENEMYSTATE.HURT]	= CargoHurt;
enemyScripts[ENEMYSTATE.DIE]	= CargoDie;

timer = 0;