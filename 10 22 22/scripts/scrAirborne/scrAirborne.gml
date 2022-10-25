// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAirborne(){
	//gravity
	if (vsp < maxFallSpeed) vsp += defaultGrav;

	
	//variable jump height
	if ((vsp < 0) && !(jump)) vsp = max(vsp,-jumpForce/4); 
	//jump
	execute_jump();
	//revert to idle if touching ground
	if (grounded)
	{
		state = states.IDLE;
		canGrapple = true;
	}
	//shoot grappling hook
	execute_grapple();
	
	//wall slide
	if (place_meeting(x-1,y,oParSolid) and (left))
	or (place_meeting(x+1,y,oParSolid) and (right))
	{
		if (vsp > 0)
		{
			state = states.WALL_SLIDE;	
			exit; //this is so you dont face other way for one frame when going from this to wall slide
		}
	} 
	
	//move and change facing
	if (move != 0)
	{
		hsp = approach(hsp, airSpeed * move, airAccel);
		facing = move
	}
}