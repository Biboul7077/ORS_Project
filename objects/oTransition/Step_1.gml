with oPlayer state = Player_StateTransition;

if leading = OUT
{
	percent = min(1, percent + TRANSITION_SPEED);
	if percent >= 1
	{
		room_goto(target);
		leading = IN;
	}
}
else //leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if percent <= 0
	{
		with oPlayer state = Player_StateFree;
		instance_destroy();
	}
}