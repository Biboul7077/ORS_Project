
//Execute State Machine
if !global.gamePaused
{
	if (enemyScripts[state] != -1) script_execute(enemyScripts[state]);
}

var _percentage = 1 - enemyHP/enemyHpMax;
var r = 255;
var g = min(1, 2 * _percentage)*255;
var b = max(0, 4 * _percentage - 3)*255;

flashColor = make_colour_rgb(r,g,b);