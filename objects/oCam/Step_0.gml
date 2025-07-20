/// @desc Update Camera
//Update Destination
if instance_exists(follow) {
	xTo = follow.x;
	yTo = follow.y;
}

//Update Object Position
x += (xTo - x) / 16;
y += (yTo - y) / 16;

//Keep camera centered inside the room
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

//Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMag));

camera_set_view_pos(cam, x - view_w_half, y - view_h_half)
//Parallax Background
var _nearBackground	= layer_get_id("Skyline_Background");

layer_x(_nearBackground, lerp(0, camera_get_view_x(cam), 0.5));