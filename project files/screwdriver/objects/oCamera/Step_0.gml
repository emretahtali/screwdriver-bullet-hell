x = lerp(x, target.x, .08);
y = lerp(y, target.y, .08);
//y = lerp(y, y_pin, .08);

x = clamp(x, width_ / 2, room_width - width_ / 2);
y = clamp(y, height_ / 2, room_height - height_ / 2);

//screenshake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain - ((1/shake_length) * shake_magnitude));

camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);