/// @description Insert description here
// You can write your code in this editor
if (window_get_height() != global.gameHeight*global.zoom
	&& window_get_width() != global.gameWidth*global.zoom
	&& !window_get_fullscreen())
{
	window_set_size(global.gameWidth*global.zoom, global.gameHeight*global.zoom);
	surface_resize(application_surface, global.gameWidth, global.gameHeight);
	display_reset(0, false);
}