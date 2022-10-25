// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrIdle(){
	//gravity
	if (vsp < maxFallSpeed) vsp += defaultGrav;
	
	hsp = approach(hsp,0,fric);
	if (move != 0) 
	{ 
		facing = move; 
		state = states.MOVE;
	}

	execute_jump();
	
	if !(grounded)
	{
		coyoteTime -= 1;
		state=states.AIRBORNE;	
	}
	else
	{
		canGrapple = true;	
	}
	
	execute_grapple();
}