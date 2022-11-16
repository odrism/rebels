// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrGrappleAim(){
	hsp = 0;
	vsp = 0;
	
	execute_grapple();
	
	if (specialBuffer < BUFFER)
	{
		grappleAimTimer = 0;
		specialBuffer = BUFFER;
		canGrapple = false;
		myGrap = -1;
		state= states.IDLE;
	}
	
	grappleAimTimer++
	
	if grappleAimTimer > grappleAimTime
	{
		vsp = 1;
	}
	
	//facing
	if mouse_x > x { facing = 1; }
	else { facing = -1; }
}