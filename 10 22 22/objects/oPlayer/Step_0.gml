///get player input
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
jumpPress = keyboard_check_pressed(ord("J"));
jump = keyboard_check(ord("J"));
grapple = keyboard_check(ord("O"));
grapplePress = keyboard_check_pressed(ord("O"));
grappleRelease = keyboard_check_released(ord("O"));

//react to inputs
move = right - left;
//lock movement
if (keyboard_check(vk_control)) move = 0;
get_angle();

image_xscale = facing;
grounded = check_below();

if (jumpBuffer < BUFFER) { jumpBuffer --; }
if (jumpBuffer < 0) { jumpBuffer = BUFFER }
if (jumpPress) { jumpBuffer--; }

if (grappleBuffer < BUFFER) { grappleBuffer --; }
if (grappleBuffer < 0) { grappleBuffer = BUFFER }
if (grappleRelease) { grappleBuffer--; }

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
}
#endregion

#region collision
//horizontal collision
var yplus = 0;
var maxSlope = 2.5;

//vertical collision
if (place_meeting(x,y+vsp,oParSolid))
{
	while(!place_meeting(x,y+sign(vsp),oParSolid))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

if (place_meeting( x, y+vsp, oParentJumpThru ) && !place_meeting( x, y, oParentJumpThru ) && sign(vsp) != -1)
{
	while(!place_meeting(x, y+sign(vsp), oParentJumpThru))
	{
        y = y + sign(vsp);
   
    }
    vsp = 0;
}

y += vsp;

if place_meeting(x+hsp,y,oParSolid)
{
    while (place_meeting(x+hsp,y-yplus,oParSolid) && yplus <= abs(maxSlope*hsp)) yplus += 1;
    if place_meeting(x+hsp,y-yplus,oParSolid)
    {
        while (!place_meeting(x+sign(hsp),y,oParSolid)) x+=sign(hsp);
        hsp = 0;
    }
    else
    {
        y -= yplus
    }
}

if !place_meeting(x,y,oParSolid) && vsp >= 0 && place_meeting(x,y+2+abs(hsp),oParSolid)
{while(!place_meeting(x,y+1,oParSolid)) {y += 1;}}


x += hsp;

#endregion
