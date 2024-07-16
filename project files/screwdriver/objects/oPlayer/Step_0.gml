key_right = (keyboard_check(vk_right) || keyboard_check(ord("D")));
key_left = (keyboard_check(vk_left) || keyboard_check(ord("A")));
key_up = (keyboard_check(vk_up) || keyboard_check(ord("W")));
key_down = (keyboard_check(vk_down) || keyboard_check(ord("S")));
key_jump = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")));

#region move

movesp = lerp(movesp, (key_up - key_down) * walksp * 3, .3);
//length = clamp(length + movesp, -250, 250);
length += movesp;
length = lerp(length, clamp(length, -1 * (rod.sprite_width / 2 - length_offset), rod.sprite_width / 2 - length_offset), .4);

//animation
image_speed = sign(movesp);
if (movesp != 0) oGameRules.move_tracker = 0;
movesp = 0;

rotsp = lerp(rotsp, (key_left - key_right) * walksp, .3);
angle += rotsp;
if (rotsp != 0) oGameRules.rot_tracker = 0;
rotsp = 0;

#endregion

#region rod change
length_offset = 74;

var _list = ds_list_create();
var _num = collision_circle_list(oPlayer.x, oPlayer.y, 96, oRod, false, true, _list, false);
if (_num > 1)
{
	for (var i = 0; i < _num; i ++)
	{
		var rod_other = _list[|i];
		if (rod_other.id != rod.id)
		{
			var dist_ = point_distance(rod.x, rod.y, rod_other.x, rod_other.y);
			var sum_ = rod.sprite_width / 2 + rod_other.sprite_width / 2;
		
			if (32 < abs(sum_ - dist_)) || (abs(sum_ - dist_) < 96)
			{
				var realdist_ = min(
				point_distance(rod.x + lengthdir_x(rod.sprite_width / 2, angle),
											 rod.y + lengthdir_y(rod.sprite_width / 2, angle),
											 rod_other.x - lengthdir_x(rod_other.sprite_width / 2, angle),
											 rod_other.y - lengthdir_y(rod_other.sprite_width / 2, angle)),
										 
				point_distance(rod.x - lengthdir_x(rod.sprite_width / 2, angle),
											 rod.y - lengthdir_y(rod.sprite_width / 2, angle),
											 rod_other.x + lengthdir_x(rod_other.sprite_width / 2, angle),
											 rod_other.y + lengthdir_y(rod_other.sprite_width / 2, angle)));

				if (realdist_ <= 144) length_offset = sign(length_offset) * realdist_ / 2;
			
				if (abs(rod.sprite_width / 2 - abs(length)) < 24) && ((sign(length) == 1 && key_up) || (sign(length) == -1 && key_down))
				{
					length = sign(length) * -1 * point_distance(oPlayer.x, oPlayer.y, rod_other.x, rod_other.y);
					rod = rod_other;
					break;
				}
			}
		}
	}
}
ds_list_destroy(_list);

#endregion

#region alignments

oRod.image_angle = angle;
image_angle = angle;

x = rod.x + lengthdir_x(length, angle);
y = rod.y + lengthdir_y(length, angle);

#endregion

if (place_meeting(x, y, oBullet)) && (!blink)
{
	blink = true;
	ScreenShake(8, 20);
}

//animations
//if (movesp)

/*
if (place_meeting(x, y + 1, oWall))
{
	if (hsp != 0)
	{
		sprite_index = sPlayerRun;
		idle_anim_reset = false;
		
		image_speed = abs(hsp) / walksp;
		
		if (image_speed != 0) image_speed = clamp(image_speed, .6, 1);
	}
	else
	{
		image_speed = 1;
		
		sprite_index = sPlayerIdle;
		if (!idle_anim_reset)
		{
			idle_anim_reset = true;
			image_index = 1;
		}
	}
	
	canjump = 5;
	on_ground = true;
	
	if (jumpbuffer > 0)
	{
		vsp = -jumpsp;
		jumpbuffer = 0;
	}
}
else
{
	sprite_index = sPlayerJump;
	image_index = 1;
	
	if (canjump > 0) canjump --;
	if (jumpbuffer > 0) jumpbuffer --;
	
	on_ground = false;
}

#region squash

if (sign(hsp) != 0) && (sign(xscale) != sign(hsp)) xscale *= -1;

var xscaletrg;
var yscaletrg;

//if ((abs(xscale) > 1.198) || (land_scale_lock)) && (oPlayer.on_ground)
if ((abs(xscale) > 1.19) || (land_scale_lock)) && (oPlayer.on_ground)
{
	xscaletrg = sign(xscale);
	yscaletrg = sign(yscale);
	land_scale_lock = true;
}
else
{
	xscaletrg = (1.2 - ((abs(vsp) / 8) * .35)) * sign(xscale);
	yscaletrg = (.8 + ((abs(vsp) / 5) * .3)) * sign(yscale);
	land_scale_lock = false;
}

yscaletrg = min(yscaletrg, 1.2);

xscale = lerp(xscale, xscaletrg, .3);
yscale = lerp(yscale, yscaletrg, .3);

#endregion