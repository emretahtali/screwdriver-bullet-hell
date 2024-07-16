#region controls
if (keyboard_check(vk_control))
{
	if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	if (keyboard_check_pressed(ord("G"))) game_restart();
	if (keyboard_check_pressed(ord("R"))) room_restart();
	if (keyboard_check_pressed(ord("P"))) room_speed = 62 - room_speed;
	if (keyboard_check_pressed(ord("D"))) global.debugmode = !global.debugmode;
}

if (keyboard_check_pressed(vk_escape)) game_end();
#endregion

#region trackers

rot_tracker ++;
move_tracker ++;

#endregion

#region bullet generation

timer ++;

#region frequent

if (timer == 30)
{
	do
	{
		var bullet_trg_x = irandom_range(oCamera.x - oCamera.width_ / 2 + 96, oCamera.x + oCamera.width_ / 2 - 96);
		var bullet_trg_y = irandom_range(oCamera.y - oCamera.height_ / 2 + 96, oCamera.y + oCamera.height_ / 2 - 96);
	}
	until(!point_in_circle(bullet_trg_x, bullet_trg_y, oCamera.x, oCamera.y, 360))
	//until (!point_in_rectangle(bullet_trg_x, bullet_trg_y, room_width / 2 - 324, room_height / 2 - 324, room_width / 2 + 324, room_height / 2 + 324))
	
	
	var bullet_ = instance_create_layer(bullet_trg_x, bullet_trg_y, "bullets", oBullet);
	timer = 0;
}

#endregion

#region anti afk

if (rot_tracker + move_tracker > 60) && (timer == 15)
{
	do
	{
		var bullet_trg_x = irandom_range(oCamera.x - oCamera.width_ / 2 + 96, oCamera.x + oCamera.width_ / 2 - 96);
		var bullet_trg_y = irandom_range(oCamera.y - oCamera.height_ / 2 + 96, oCamera.y + oCamera.height_ / 2 - 96);
	}
	until(!point_in_circle(bullet_trg_x, bullet_trg_y, oCamera.x, oCamera.y, 360))
	//until (!point_in_rectangle(bullet_trg_x, bullet_trg_y, room_width / 2 - 324, room_height / 2 - 324, room_width / 2 + 324, room_height / 2 + 324))
	
	
	var bullet_ = instance_create_layer(bullet_trg_x, bullet_trg_y, "bullets", oBullet);
	bullet_.sprite_index = sBullet2;
}

#endregion

#endregion