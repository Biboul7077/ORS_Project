var _entity	=	instance_place(x,y,pEntity);
var _break	=	false;

if _entity != noone
{
	with(_entity)
	{
		if object_is_ancestor(object_index,pEnemy)
		{
			HurtEnemy(id,5,other.id,48);
			_break = true
		}
		if entityHitScript != -1
		{
			script_execute(entityHitScript);
			_break = true;
		}
	}
	if _break instance_destroy();
}

if point_distance(xstart,ystart,x,y) > disShoot instance_destroy();