repeat(6) {
	with instance_create_depth(x,y,depth-1,oParticles) {
		sprite_index	= sDust;
		image_angle		= random(360);
		fric = 0.8;
		motion_add(other.image_angle+random_range(-70,70),random_range(-4,-9));
	}
}
instance_destroy();