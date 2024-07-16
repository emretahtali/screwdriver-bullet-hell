if (global.debugmode) application_surface_draw_enable(true);
else
{
	application_surface_draw_enable(false);
	
	if (window_get_width() * (3 / 4) <= window_get_height())
	{
		var _width = window_get_width();
		var _height = _width * (3 / 4);
	}
	else
	{
		var _height = window_get_height();
		var _width = _height * (4 / 3);
	}
	
	var _x = window_get_width() / 2 - _width / 2;
	var _y = window_get_height() / 2 - _height / 2;
	
	#region bulge shader
	/*
	shader_set(shBulge);
	
	var u_winResolution = shader_get_uniform(shBulge, "u_winResolution");
	shader_set_uniform_f(u_winResolution, window_get_width(), window_get_height());

	var u_resolution = shader_get_uniform(shBulge, "u_resolution");
	shader_set_uniform_f(u_resolution, _width, _height);

	var u_texture = shader_get_sampler_index(shBulge, "u_texture");
	var _tex = surface_get_texture(application_surface);
	texture_set_stage(u_texture, _tex);
	
	var bulge_dir = (sign(screen_bulge) - 1) / 2;
	screen_bulge = abs(screen_bulge);
	
	var u_bulge = shader_get_uniform(shBulge, "u_bulge");
	shader_set_uniform_f(u_bulge, screen_bulge);
	
	var u_bulge_dir = shader_get_uniform(shBulge, "u_bulge_dir");
	shader_set_uniform_f(u_bulge_dir, bulge_dir);
	*/
	#endregion
	
	#region stripes shader
	/*
	shader_set(shStripes);
	
	var u_winResolution = shader_get_uniform(shStripes, "u_winResolution");
	shader_set_uniform_f(u_winResolution, window_get_width(), window_get_height());

	var u_resolution = shader_get_uniform(shStripes, "u_resolution");
	shader_set_uniform_f(u_resolution, _width, _height);
	*/
	#endregion
	
	#region bulgeStripes shader
	
	shader_set(shBulgeStripes);
	
	var u_winResolution = shader_get_uniform(shBulgeStripes, "u_winResolution");
	shader_set_uniform_f(u_winResolution, window_get_width(), window_get_height());

	var u_resolution = shader_get_uniform(shBulgeStripes, "u_resolution");
	shader_set_uniform_f(u_resolution, _width, _height);

	var u_texture = shader_get_sampler_index(shBulgeStripes, "u_texture");
	var _tex = surface_get_texture(application_surface);
	texture_set_stage(u_texture, _tex);
	
	var bulge_dir = (sign(screen_bulge) - 1) / 2;
	screen_bulge = abs(screen_bulge);
	
	var u_bulge = shader_get_uniform(shBulgeStripes, "u_bulge");
	shader_set_uniform_f(u_bulge, screen_bulge);
	
	var u_bulge_dir = shader_get_uniform(shBulgeStripes, "u_bulge_dir");
	shader_set_uniform_f(u_bulge_dir, bulge_dir);
	
	#endregion
	
	draw_surface_ext(application_surface, _x, _y, _width / 1024, _height / 768, 0, c_white, 1);
	shader_reset();
}