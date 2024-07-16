/// @function ScreenShake(magnitude, frames);
/// @param {real}  magnitude sets the strength of the shake (radius in pixels).
/// @param {real}  frames sets the length of the shake in frames (60 = 1 second in 60 fps).

function ScreenShake(_magnitude, _frames)
{
	with (oCamera)
	{
		if (_magnitude > shake_remain)
		{
			shake_magnitude = _magnitude;
			shake_remain = _magnitude;
			shake_length = _frames;
		}
	}
}
