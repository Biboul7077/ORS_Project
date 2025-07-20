/// @desc ScreenShake(magnitude,frames)
/// @arg _magnitude sets the strength of the shake (distance range)
/// @arg _frames sets the length of the shake in frames (60 = 1 second)

function ScreenShake(_magnitude,_frames){
	with global.iCamera
	{
		if _magnitude > shakeRemain
		{
			shakeMag = _magnitude;
			shakeRemain = shakeMag;
			shakeLength = _frames;
		}
	}
}