// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrIdle(){
	//gravity
	if (vsp < maxFallSpeed) vsp += defaultGrav;
	
	//approach 0 speed horizontally
	hsp = approach(hsp,0,fric);
	
	//switch to move state if moving
	if (move != 0) 
	{ 
		facing = sign(move); 
		state = states.MOVE;
	}

	//jump
	execute_jump();
	
	//switch to airborne state if not on ground
	if !(grounded)
	{
		coyoteTime -= 1;
		state=states.AIRBORNE;	
	}
	//resets grapple if on ground
	else
	{
		canGrapple = true;	
	}
	
	//enter grapple aim state
	if (grapplePress) and (canGrapple)
	{
		state = states.GRAPPLE_AIM	
	}
	
	//enter building state
	execute_building();
}