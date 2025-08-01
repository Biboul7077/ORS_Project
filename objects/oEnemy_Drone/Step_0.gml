// Inherit the parent event
event_inherited();

if state = ENEMYSTATE.CHASE
{
	timer++;
	var _playerDir = point_direction(x, y, oPlayer.x, oPlayer.y);
	var _MarginOfError = irandom_range(-15, 15);

	// Exemple : cercle complet de 20 bullets avec une rotation progressive
	if (timer % 45 == 0) {
	    pattern_fire({
	        X: x,
	        Y: y,
	        bullet_speed: 2,
	        count: 1,
	        angle_start: _playerDir + _MarginOfError,
	        angle_range: 45,
	        angle_offset: 0, // pour faire tourner le cercle
	        bullet_sprite: sBullet_Enemy
	    });
	}
}