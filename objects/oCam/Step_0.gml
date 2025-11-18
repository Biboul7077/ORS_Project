/// @desc Update Camera
//Update Destination
if instance_exists(follow) {
	xTo = follow.x;
	yTo = follow.y;
}

//Update Object Position
x += (xTo - x) / 15;
y += (yTo - y) / 15;

//Keep camera centered inside the room
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

//Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMag));

camera_set_view_pos(cam, x - view_w_half, y - view_h_half)

//Parallax Background
var _farSkyline	= layer_get_id("Skyline_Back");
var _midSkyline	= layer_get_id("Skyline_Mid");
var _nearSkyline	= layer_get_id("Skyline_Front");
var _foreGround = layer_get_id("Foreground")

layer_x(_nearSkyline, lerp(0, camera_get_view_x(cam), 0.3));
layer_x(_midSkyline, lerp(0, camera_get_view_x(cam), 0.5));
layer_x(_farSkyline, lerp(0, camera_get_view_x(cam), 0.7));
layer_x(_foreGround, lerp(0, camera_get_view_x(cam), 0.2) - 256);

layer_y(_nearSkyline, lerp(0, camera_get_view_y(cam), 0.2));
layer_y(_midSkyline, lerp(0, camera_get_view_y(cam), 0.4));
layer_y(_farSkyline, lerp(0, camera_get_view_y(cam), 0.6));
layer_y(_foreGround, camera_get_view_y(cam));