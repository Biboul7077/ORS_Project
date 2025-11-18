show_debug_overlay(keyboard_check(vk_shift));

if keyboard_check_pressed(vk_numpad0) global.locale = LOCALE.EN;
if keyboard_check_pressed(vk_numpad1) global.locale = LOCALE.FR;
if keyboard_check_pressed(vk_numpad2) global.locale = LOCALE.DE;

cursor_sprite = sTarget;
window_set_cursor(cr_none);

if global.hp <= 0.01
{
	game_restart();
}

if global.currencyBuffer > 0
{
	if global.currencyTimer > 0
	{
		global.currencyTimer --;
	}
	else
	{
		var _amount = min(CURRENCY_ADDITION_SPEED, global.currencyBuffer);
		var _total = global.currencyTotal + _amount;
		if _total < CURRENCY_CAP global.currencyTotal += _amount;
		global.currencyBuffer -= _amount;
	}
}