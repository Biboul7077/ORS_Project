var _n = 0;

for (var i = 0; i < array_length(enemyList); i += 1)
{
	if instance_exists(enemyList[i]) _n += 1;
}

if _n <= 0 instance_destroy();