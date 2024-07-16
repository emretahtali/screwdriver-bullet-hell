if (!point_in_rectangle(x, y, -128, -128, room_width + 128, room_height + 128)) instance_destroy();

if (image_index == image_number - 1)
{
	image_speed = 0;
	
	x += lengthdir_x(spd, dir_trg);
	y += lengthdir_y(spd, dir_trg);
}

image_angle = dir_trg;