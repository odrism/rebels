if (keyboard_check(vk_shift))
{
	room_speed = 30
}
else
{
	room_speed = 60;
}



//delta time
global.actualDelta = delta_time/1000000;
global.deltaMultiplier = global.actualDelta / global.targetDelta