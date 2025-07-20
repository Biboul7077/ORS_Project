var _arr = messages[|messageID];

var _text = _arr[MSG.TEXT];

messageText = string_copy(_text, 1, messageChar);

if messageChar <= string_length(_text) messageChar += messageSpd;

else if keyboard_check_pressed(vk_space)
{
	if messageID < ds_list_size(messages)-1
	{
		messageID++;
		messageChar = 0;
	}
	else
	{
		oPlayer.state = oPlayer.lastState;
		instance_destroy();
	}
}