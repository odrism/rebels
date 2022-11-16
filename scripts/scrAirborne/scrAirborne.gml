// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAirborne(){
	//gravity
	if (vsp < maxFallSpeed) vsp += defaultGrav * global.deltaMultiplier;

	
	//variable jump height
	 if ((vsp < 0) && jumpRelease) vsp = max(vsp,-6); 
	//jump
	execute_jump();
	//revert to idle if touching ground
	if (grounded)
	{
		state = states.IDLE;
		canGrapple = true;
	}
	
	//facing
	if (mouse_x > x) {facing = 1; } else { facing = -1; }
	
	//shoot grappling hook
	if (grapplePress) and (canGrapple)
	{
		state = states.GRAPPLE_AIM	
	}
	
	//wall slide
	if (place_meeting(x-1,y,oSolid) and (left))
	or (place_meeting(x+1,y,oSolid) and (right))
	{
		if (vsp > 0)
		{
			state = states.WALL_SLIDE;	
			exit; //this is so you dont face other way for one frame when going from this to wall slide
		}
	} 
	
	//move and change facing
	if (move != 0) and (abs(hsp) < moveSpeed)
	{
		hsp = approach(hsp, airSpeed * move, 0.6);
	}
	else
	{
		hsp = approach(hsp,0,0.1);	
	}
	
	//enter shop state
	execute_shop();

}