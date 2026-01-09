var _playerHealth		= floor(global.playerHealth);
var _playerHealthMax	= floor(global.playerHealthMax);
var _playerHealthRatio	= _playerHealth/_playerHealthMax

var _playerHealthX		= 8;
var _playerHealthY		= 8;
var _playerHealthW		= sprite_get_width(sHealthbar) * _playerHealthRatio;
var _playerHealthH		= sprite_get_height(sHealthbar);

var _ammoX	= _playerHealthX + 8;
var _ammoY	= _playerHealthY + sprite_get_height(sHealthbarBorder) + 4;
var _playerAmmo	= global.playerAmmo;

draw_set_colour(c_white);

draw_sprite(sHealthbarBorder, 0, _playerHealthX, _playerHealthY);
draw_sprite_stretched(sHealthbar, 0, _playerHealthX, _playerHealthY,_playerHealthW,_playerHealthH);

for (var i = global.playerAmmoMax; i > 0; i--)
{
	var _imageIndex = 0;
	var _playerAmmoIncrementX = 0
    if i < _playerAmmo
	{
		_imageIndex = 1;
	}
	if i == _playerAmmo
	{
		_imageIndex = 1;
		_playerAmmoIncrementX = 4;
	}
	draw_sprite(sPlayerAmmo, _imageIndex, _ammoX + _playerAmmoIncrementX, _ammoY);
	_ammoY += (sprite_get_height(sPlayerAmmo) + 4);
}

if instance_exists(oPlayer) {
	draw_set_alpha(1);
	for (var i = 0; i < 100 * _playerHealthRatio; i++)
	{
		var r = 255;
		var g = min(1, 2 * i/100)*255;
		var b = max(0, 4 * i/100 - 3)*255;

		global.playerFlashColor = make_colour_rgb(r,g,b);
	}
	draw_set_color(c_white);
	draw_set_font(Fnt_Name);
	draw_text(healthbar_x, healthbar_y + 36, "$ " + string(global.currencyTotal));
	
	draw_set_colour(#CDCDCD);
	if global.currencyBuffer > 0
	{
		draw_text(healthbar_x, healthbar_y + 52, "+ $ " + string(global.currencyBuffer));
	}
}

///Pause Screen
if global.gamePaused
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fntText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "... GAME PAUSED ...");
	for (var i = 0; i < array_length(pauseOption); i++)
	{
	    var _print = "";
		if i == pauseOptionSelected
		{
			_print += $"> {pauseOption[i]} <";
		}
		else
		{
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 28 + (i * 16), _print);
		draw_set_alpha(1.0);
	}
}