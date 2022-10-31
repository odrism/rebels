// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_jump(){
	if ((grounded) or coyoteTime<BUFFER) and jumpBuffer<BUFFER
	{
		vsp = -jumpForce;	
		state = states.AIRBORNE;
		jumpBuffer = BUFFER;
		coyoteTime = BUFFER;
	}
}
