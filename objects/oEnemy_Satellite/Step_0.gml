if instance_exists(orbit_target) {
    orbit_angle += orbit_speed;

    var cx = orbit_target.x;
    var cy = orbit_target.y;

    x = cx + lengthdir_x(orbit_radius, radtodeg(orbit_angle));
    y = cy + lengthdir_y(orbit_radius, radtodeg(orbit_angle));
}
else {
    instance_destroy();
}
