// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrDash(){
	//increment timer
	dashTimer++;
	

	//jump
	execute_jump();

	//shoot grappling hook
	if (grapplePress) and (canGrapple)
	{
		state = states.GRAPPLE_AIM	
	}
	
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

	//reset to airborne on timer
	if (dashTimer > dashTime)
	{
		dashTimer = 0;
		state = states.IDLE;	
	}
}