event_inherited();


var _imageChangeTime = 30;
imageTimer++;
if imageTimer % _imageChangeTime = 0
{
	var _imageProbability = random(1);
	if _imageProbability < 0.7
	{
		image_index = 0;
	} else {
		image_index = irandom_range(1, image_number)
	}
}