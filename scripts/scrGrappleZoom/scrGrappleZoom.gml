// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrGrappleZoom(){
	var _angle = point_direction(x,y-sprite_get_height(sprite_index)/2,myGrap.x,myGrap.y);
	var stuck = false;
	canGrapple = false;
	
	//move towards hook if it exists and is on a solid
	if (myGrap != -1)
	{
		if (myGrap.state = grapStates.hookedWall)
		{
				hsp = lengthdir_x(30,_angle);
				vsp = lengthdir_y(30,_angle);
				if (place_meeting(x+1,y,oParSolid) or place_meeting(x-1,y,oParSolid))
				{
					stuck = true;
				}
				if (place_meeting(x,y+1,oParSolid) or place_meeting(x,y-1,oParSolid))
				{
					stuck = true;
				}
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
		instance_destroy(myGrap)
		myGrap = -1;
			
	}
	
	//end zoom if stuck
	if (collision_line(x,y,myGrap.x,myGrap.y,oParSolid,true,true)) and stuck
	{
		state = states.IDLE;
		instance_destroy(myGrap);
		myGrap = -1;
	}
}