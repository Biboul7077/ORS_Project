speed*=fric;
timer -= 1;
if timer < 0
{
    var _direction = point_direction(x, y, oPlayer.x, oPlayer.y);
    
    var _force =1.2;
    var _speed = 6;
    
    var _hsp = lengthdir_x(_force, _direction);
    var _vsp = lengthdir_y(_force, _direction);
    
    _hsp = clamp(_hsp, -_speed, _speed);
    _vsp = clamp(_vsp, -_speed, _speed);
    
    hspeed += _hsp;
    vspeed += _vsp;
}