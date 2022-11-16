// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrWallJump(){
	//increment timer
	wallJumpTimer ++;
	
	//move
	if (move != 0)
	{
		hsp = approach(hsp, airSpeed * move, airAccel);
	}
	
	//grapple
	execute_grapple()
	
	//reset state at end of timer
	if (wallJumpTimer > wallJumpTime)
	{
		wallJumpTimer = 0;
		state = states.AIRBORNE;
	}
}