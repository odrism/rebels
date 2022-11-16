// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrGrappling(){
	
	canGrapple = false;
	
	if (myGrap != -1)
	{
		if (myGrap.state = grapStates.flying)
		{
			hsp = 0; vsp = 0;
		}
		if (myGrap.state = grapStates.hookedWall)
		{		
			if (vsp < maxFallSpeed) vsp += defaultGrav;
			
			var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
			_ropeAngleAcceleration += (right-left) * 0.08
			
			//rope length adjustment
			var cant =  (up and place_meeting(x,y-1,oParSolid))
			if !cant {	ropeLength += (down - up) * 4 * weight; } //lighter characters climb faster
			if ropeLength > 640 { ropeLength = 640; }
			if ropeLength < 5 { ropeLength = 5; }
			
			
			ropeAngleVelocity += _ropeAngleAcceleration * weight; //heavier characters accelerate faster
			ropeAngle += ropeAngleVelocity * global.deltaMultiplier;
			ropeAngleVelocity *= 0.99 - (weight * 0.003); //heavier characters slow down faster
				
			ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle);
			ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);

			hsp = approach(hsp,ropeX - x,10);
			vsp = approach(vsp,ropeY - y,10);	
		}
	}
	//jump cancel
	if (jumpBuffer < BUFFER) and (myGrap.state = grapStates.hookedWall)
	{
		if (myGrap != -1) { instance_destroy(myGrap); }
		myGrap = -1;
		vsp = -jumpForce/1.25;
		if abs(hsp) > (20 * weight) { hsp = sign(hsp) * 20 * weight }
		canGrapple = false;
		state = states.AIRBORNE;
		exit;
	}
	//zoom to hook
	if (attackBuffer < BUFFER) and (myGrap.state = grapStates.hookedWall)
	{
		hsp = 0;
		vsp = 0;
		canGrapple = false;
		state = states.GRAPPLE_ZOOM;	
	}
}