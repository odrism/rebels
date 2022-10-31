player_controls();

//react to inputs
move = right - left;

image_xscale = facing;
grounded = check_below();
currentSquare = instance_position(x,y,oSquare)

if (jumpBuffer < BUFFER) { jumpBuffer --; }
if (jumpBuffer < 0) { jumpBuffer = BUFFER }
if (jumpPress) { jumpBuffer--; }

if (grappleBuffer < BUFFER) { grappleBuffer --; }
if (grappleBuffer < 0) { grappleBuffer = BUFFER }
if (grappleRelease) { grappleBuffer--; }

if (attackBuffer < BUFFER) { attackBuffer --; }
if (attackBuffer < 0) { attackBuffer = BUFFER }
if (attackPress) { attackBuffer--; }

if (buildBuffer < BUFFER) { buildBuffer --; }
if (buildBuffer < 0) { buildBuffer = BUFFER }
if (buildPress) { buildBuffer--; }

if (coyoteTime < BUFFER) { coyoteTime --; }
if (coyoteTime < 0) { coyoteTime = BUFFER }


#region state machine
switch (state)
{
	case states.IDLE:
		scrIdle();
	break;
	
	case states.MOVE:
		scrMove();
	break;
	
	case states.AIRBORNE:
		scrAirborne();
	break;
	
	case states.JUMP:
		scrJump();
	break;
	
	case states.WALL_SLIDE:
		scrWallSlide();
	break;
	
	case states.WALL_JUMP:
		scrWallJump();
	break;
	
	case states.GRAPPLING:
		scrGrappling();
	break;
	
	case states.GRAPPLE_AIM:
		scrGrappleAim();
	break;
	
	case states.GRAPPLE_ZOOM:
		scrGrappleZoom();
	break;
	
	case states.BUILDING:
		scrBuilding();
	break;
}
#endregion

#region collision
hsp += hspFraction;
vsp += vspFraction;
hspFraction = frac(hsp);
vspFraction = frac(vsp);
hsp -= hspFraction;
vsp -= vspFraction;
//horizontal
if (place_meeting(x+hsp,y,oParSolid))
{
	var _hStep = sign(hsp);
	var yplus = 0;
	while (place_meeting(x+hsp,y-yplus,oParSolid) and yplus <= abs(2*hsp)) yplus ++;
	if place_meeting(x+hsp,y-yplus,oParSolid)
	{
		hsp = 0;
		hspFraction = 0;
		while(!place_meeting(x+_hStep,y,oParSolid)) x += _hStep;	
		if (state ==states.GRAPPLING)
		{
			ropeAngle = point_direction(grappleX,grappleY,x,y);
			ropeAngleVelocity = 0;

		}
	}
	else
	{
		y -= yplus	
	}
}
x += hsp;

if (state != states.GRAPPLING)
{
	if !place_meeting(x,y,oParSolid) && vsp >= 0 && place_meeting(x,y+2+abs(hsp),oParSolid)
	{while(!place_meeting(x,y+1,oParSolid)) {y += 1;}}
}
//vertical
if (place_meeting(x,y+vsp,oParSolid))
{
	var _vStep = sign(vsp);
	vsp = 0;
	vspFraction = 0;
	while(!place_meeting(x,y+_vStep,oParSolid)) y += _vStep;	
	if (state == states.GRAPPLING)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y);
		ropeAngleVelocity = 0;
	}
}

//jump thru
var jumpThru = (instance_place( x, y+vsp, oParentJumpThru ))

if (jumpThru != noone)
{
	if !place_meeting( x, y, jumpThru ) && sign(vsp) != -1 and !(down and jump)
	{
		var _vStep = sign(vsp);
		vsp = 0;
		vspFraction = 0;
		grounded = true
		while(!place_meeting(x,y+_vStep,jumpThru)) y += _vStep;	
		if (state == states.GRAPPLING)
		{
			ropeAngle = point_direction(grappleX,grappleY,x,y);
			ropeAngleVelocity = 0;

		}
	}
}

y += vsp;
#endregion

//lock movement
if (keyboard_check(vk_control)) move = 0;
get_angle();