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

PatternSatellite({
    X: x,
    Y: y,
    bullet_speed: 2,
    count: 4,
    angle_start: 0,
    angle_range: 360,
    angle_offset: 0, // pour faire tourner le cercle
	orbit_radius: 64,
	orbit_speed: 0.05,
	orbit_target: id,
	orbit_dynamic: true,
    bullet_sprite: sBullet_Enemy
});