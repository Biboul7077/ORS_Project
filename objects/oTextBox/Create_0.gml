messages = ds_list_create();
messageID = 0;

messageText = "";
messageChar = 0;
messageSpd = 0.3;

enum MSG {
	TEXT,
	NAME,
	IMAGE,
	SUBIMAGE,
}

var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

height = floor(_guiH * 0.35);
width = _guiW;

x = 0
y = _guiH - height;

firstPadding = 24;
padding = 16

Fnt_Name = font_add("President Evil.ttf", 32, false, false, 32, 128);