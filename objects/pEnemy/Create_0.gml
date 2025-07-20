event_inherited();

//Intrinsic variables
state				= ENEMYSTATE.IDLE;
enemyHpMax			= enemyHP;
hsp					= 0;
vsp					= 0;
xTo					= xstart;
yTo					= ystart;
dir					= 0;
timePassed			= 0;
waitDuration		= 60;
wait				= 0;
aggroCheck			= 0;
aggroCheckDuration	= 5;
stateTarget			= state;
statePrevious		= state;
stateWait			= 0;
stateWaitDuration	= 0;

//Enemy Sprites
sprMove = sEnemy_Ball;

//Enemy Scripts
enemyScripts[ENEMYSTATE.IDLE]	= -1;
enemyScripts[ENEMYSTATE.WANDER]	= -1;
enemyScripts[ENEMYSTATE.CHASE]	= -1;
enemyScripts[ENEMYSTATE.ATTACK]	= -1;
enemyScripts[ENEMYSTATE.HURT]	= -1;
enemyScripts[ENEMYSTATE.DIE]	= -1;
enemyScripts[ENEMYSTATE.WAIT]	= EnemyWait;