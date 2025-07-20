audio_listener_position(oPlayer.x, oPlayer.y, 0);

show_debug_overlay(keyboard_check(vk_shift));

if keyboard_check_pressed(vk_numpad0) global.locale = LOCALE.EN;
if keyboard_check_pressed(vk_numpad1) global.locale = LOCALE.FR;
if keyboard_check_pressed(vk_numpad2) global.locale = LOCALE.DE;

cursor_sprite = sTarget;
window_set_cursor(cr_none);

global.hp += 0.0005;
global.hp = clamp(global.hp, 0, 6);