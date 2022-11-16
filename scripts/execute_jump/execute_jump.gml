// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_jump(){
	if ((grounded) or coyoteTime<BUFFER) and jumpBuffer<BUFFER and !(place_meeting(x,y+1,oParentJumpThru) and !position_meeting(x,y,oParentJumpThru) and down)
	{
		vsp = -jumpForce;	
		state = states.AIRBORNE;
		jumpBuffer = BUFFER;
		coyoteTime = BUFFER;
	}
}
