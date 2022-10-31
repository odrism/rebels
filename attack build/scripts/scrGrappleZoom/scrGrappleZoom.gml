// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrGrappleZoom(){
	var _angle = point_direction(x,y-sprite_get_height(sprite_index)/2,myGrap.x,myGrap.y);
	canGrapple = false;
	
	//move towards hook if it exists and is on a solid
	if (myGrap != -1)
	{
		if (myGrap.state = grapStates.hookedWall)
		{
				hsp = lengthdir_x(30,_angle);
				vsp = lengthdir_y(30,_angle);
		}
	}
	
	//jump cancel
	if (jumpBuffer < BUFFER) and (myGrap.state = grapStates.hookedWall)
	{
		if (myGrap != -1) { instance_destroy(myGrap); }
		myGrap = -1;
		vsp = -jumpForce/1.25;
		state = states.AIRBORNE;
		exit;
	}
	//end zoom if near hook
	if (distance_to_object(myGrap) <= 32)
	{
		state = states.IDLE;
		if (vsp < 0) { vsp *= 3 }
		instance_destroy(myGrap)
		myGrap = -1;
			
	}
}