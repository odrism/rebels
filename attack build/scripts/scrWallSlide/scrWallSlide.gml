// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrWallSlide(){
	//slide down wall
	vsp = 1;
	
	//cant grapple while in this state
	canGrapple = false;
	
	//change facing and exit when moving in other direction
	if (place_meeting(x-1,y,oParSolid)) 
	{
		facing = 1;
		if move == 1 { state = states.AIRBORNE; canGrapple = true; }
	}
	if (place_meeting(x+1,y,oParSolid)) 
	{
		facing = -1;
		if move == -1 { state = states.AIRBORNE; canGrapple = true; }
	}
	
	//exit state if not holding move key
	if (move == 0) { state = states.AIRBORNE; canGrapple = true; }
	
	//jump! might as well jump
	if (jumpBuffer < BUFFER)
	{
		hsp = 10*facing
		vsp = -12;
		jumpBuffer = BUFFER;
		state = states.WALL_JUMP;
	}
	
	if !(place_meeting(x+1,y,oParSolid)) and !(place_meeting(x-1,y,oParSolid))
	{
		state = states.IDLE;	
	}
	
	if (grounded)
	{
		state = states.IDLE;	
	}
}