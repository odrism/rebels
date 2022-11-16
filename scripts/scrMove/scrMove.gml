// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrMove(){
	//gravity
	if (vsp < maxFallSpeed) vsp += defaultGrav * global.deltaMultiplier;
	
	if (abs(hsp) < moveSpeed)
	{
		hsp = approach(hsp, moveSpeed * move, accel);
	}
	else
	{
		hsp = approach(hsp, moveSpeed * move, accel/5);
	}
	if (move == 0)
	{
		state = states.IDLE;	
	}
	
	//facing
	if (mouse_x > x) {facing = 1; } else { facing = -1; }
	
	execute_jump();
	
	if !(grounded)
	{
		coyoteTime -= 1;
		state=states.AIRBORNE;	
	}
	
	if (grapplePress) and (canGrapple)
	{
		state = states.GRAPPLE_AIM	
	}
	
	//enter shop state
	execute_shop();
	
}