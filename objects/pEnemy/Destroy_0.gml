var coin_value = [1, 5, 20]

for (var i = 0; i < 2; ++i) {
    repeat enemyMoneyLoot[i]
	{
		with instance_create_layer(x,y,"Inst_Particles",oCoin)
		{
			value = coin_value[i];
			image_angle		= random(360);
			fric = 0.8;
			motion_add(other.image_angle+random_range(-70,70),random_range(-4,-9));
		}
	}
}