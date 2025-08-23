function pattern_fire(pattern) {
    var X				= pattern.X;
    var Y				= pattern.Y;
    var count			= pattern.count;
    var angle_start		= pattern.angle_start;
    var angle_range		= pattern.angle_range;
    var angle_offset	= pattern.angle_offset;
    var bullet_speed	= pattern.bullet_speed;
    var bullet_sprite	= pattern.bullet_sprite;
    var bullet_damage	= pattern.bullet_damage;

    for (var i = 0; i < count; i++) {
        var angle = angle_start + (angle_range / count) * i + angle_offset;

        var b = instance_create_layer(x, y, "Inst_Particles", oEnemy_Bullet);
        b.speed				= bullet_speed;
        b.direction			= angle;
        b.sprite_index		= bullet_sprite;
		b.bulletDamageTouch	= bullet_damage;
    }
}

function PatternSatellite(pattern)
{
    var X				= pattern.X;
    var Y				= pattern.Y;
    var count			= pattern.count;
    var angle_start		= pattern.angle_start;
    var angle_range		= pattern.angle_range;
    var angle_offset	= pattern.angle_offset;
    var bullet_speed	= pattern.bullet_speed;
    var bullet_sprite	= pattern.bullet_sprite;
	var bullet_damage	= pattern.bullet_damage;

    for (var i = 0; i < count; i++) {
        var angle = angle_start + (angle_range / count) * i + angle_offset;

        var b = instance_create_layer(x, y, "Inst_Particles", oEnemy_Satellite);
        b.is_orbiting		= true;
	    b.orbit_radius		= pattern.orbit_radius;
	    b.orbit_speed		= pattern.orbit_speed;
	    b.orbit_angle		= angle * pi / 180;
	    b.orbit_target		= pattern.orbit_target;
	    b.orbit_dynamic		= pattern.orbit_dynamic;
		b.bulletDamageTouch	= bullet_damage;
    }
}