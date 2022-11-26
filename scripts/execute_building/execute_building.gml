// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_building(){
	if (shopPress)
	{
		if (facing == 1) { buildAngle = 0; }
		else if (facing == -1) { buildAngle = 180; }
		state = states.BUILDING
	}
}