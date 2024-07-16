if (blink) 
{
	blink_timer ++;
	if (blink_timer == (40 div blinksp) * blinksp)
	{
		blink_timer = 0;
		blink = false;
		draw_self();
	}
	else if ((blink_timer div blinksp) % 2 == 1) draw_self();
}
else draw_self();

/*
shader_set(shColor);

var uColor = shader_get_uniform(shColor, "uColor");
shader_set_uniform_f(uColor, color[0], color[1], color[2]);

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, c_white, 1);

shader_reset();