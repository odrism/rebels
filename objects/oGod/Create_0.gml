window_set_fullscreen(true)


//delta time
global.targetDelta = 1/60;
global.actualDelta = delta_time/1000000;
global.deltaMultiplier = global.actualDelta / global.targetDelta


depth = -999999

enum characters
{
	kami,
	dublin,
	godric,
	angus
}

display_set_gui_size(2880,1620)