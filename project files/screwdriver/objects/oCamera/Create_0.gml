width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

camera_set_view_size(view_camera[0],  width_ * (10 / 10), height_ * (10 / 10));

target = oPlayer;

y_pin = target.y - height_ * (3 / 8);

x = target.x;
y = target.y;
//y = y_pin;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;