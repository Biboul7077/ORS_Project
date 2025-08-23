/// @desc RoomTransition(_type, _targetRoom)
/// @arg _type
/// @arg _targetRoom
function RoomTransition(_type, _targetRoom, _text = -1){
	if !instance_exists(oTransition)
	{
		with instance_create_depth(0, 0, -9999, oTransition)
		{
			type	= _type;
			target	= _targetRoom;
			region_text	= _text;
		}
	}
	else
	{
		show_debug_message("Trying to transition while transition is happening already");
	}
}