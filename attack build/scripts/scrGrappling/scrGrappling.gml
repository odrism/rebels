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
			ropeLength += (down - up) * 4;
			ropeLength = max(ropeLength,15);
			ropeAngleVelocity += _ropeAngleAcceleration;
			ropeAngle += ropeAngleVelocity;
			ropeAngleVelocity *= 0.99;
				
			ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle);
			ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);

			hsp = ropeX - x;
			vsp = ropeY - y;		
		}
	}
	//jump cancel
	if (jumpBuffer < BUFFER) and (myGrap.state = grapStates.hookedWall)
	{
		if (myGrap != -1) { instance_destroy(myGrap); }
		myGrap = -1;
		vsp = -jumpForce/1.25;
		canGrapple = false;
		state = states.AIRBORNE;
		exit;
	}
	//attack cancel
	if (attackBuffer < BUFFER) and (myGrap.state = grapStates.hookedWall)
	{
		hsp = 0;
		vsp = 0;
		canGrapple = false;
		state = states.GRAPPLE_ZOOM;	
	}
}