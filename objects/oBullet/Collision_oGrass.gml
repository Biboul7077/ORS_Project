if other.sprite_index != sBurntGrass {
	other.sprite_index = sBurntGrass;

	repeat(2) {
		with instance_create_depth(x,y,depth-1,oParticles) {
			sprite_index=sSmoke;
			fric = 0.8;
			motion_add(-90+random_range(-20,20),random_range(-4,-9))
		}
	}
	with instance_create_depth(other.x,other.y - 8,depth-1,oParticles) {
		sprite_index=sFireSpark;
		fric = 0.6;
	}
}