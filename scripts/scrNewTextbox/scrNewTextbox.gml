function NewTextbox(){
	if !instance_exists(oTextBox) {
		var _tb = instance_create_layer(0,0, "Inst_Management", oTextBox);
		
		var _list = _tb.messages;
		
		for (var i=0; i<array_length(activate.entityActivateArgs); i++) {
			var _arr = activate.entityActivateArgs[i];
			
			ds_list_add(_list, _arr);
		}
	}
	
	with oPlayer
	{
		if state != Player_StateLocked
		{
			lastState = state;
			state = Player_StateLocked;
		}
	}
}