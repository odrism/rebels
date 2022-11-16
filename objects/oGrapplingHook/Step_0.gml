image_angle = angle;
depth = owner.depth--;

lifetime ++;


switch (state)
{
	case grapStates.flying:
		if distance_to_object(owner) > 640
		{
			state = grapStates.retracting;	
		}
		
		var yplus = 0;

		var pos = instance_place(x+hsp,y,oParSolid)
		if pos
		{
		   
		    if place_meeting(x+hsp,y-yplus,oParSolid)
		    {
		        while (!place_meeting(x+sign(hsp),y,oParSolid)) { x+=sign(hsp); }
		        owner.grappleX = x;
				owner.grappleY = y;
				owner.ropeX = owner.x;
				owner.ropeY = owner.y;
				owner.ropeAngleVelocity = 0;
				owner.ropeAngle = point_direction(x,y,owner.x,owner.y);
				owner.ropeLength = point_distance(x,y,owner.x,owner.y);
				grappledTo = pos;
				grappledToOffsetX = x - pos.x;
				grappledToOffsetY = y - pos.y;
				audio_play_sound(sndGrappleHookWall,1,false);
				state = grapStates.hookedWall;
				
		    }
		    else
		    {
		        y -= yplus
		    }


			//vertical collision
			if (place_meeting(x,y+vsp,oParSolid))
			{
				while(!place_meeting(x,y+sign(vsp),oParSolid))
				{
					y += sign(vsp);
				}
				owner.grappleX = x;
				owner.grappleY = y;
				owner.ropeX = owner.x;
				owner.ropeY = owner.y;
				owner.ropeAngleVelocity = 0;
				owner.ropeAngle = point_direction(x,y,owner.x,owner.y);
				owner.ropeLength = point_distance(x,y,owner.x,owner.y);
				grappledTo = pos;
				grappledToOffsetX = x - pos.x;
				grappledToOffsetY = y - pos.y;
				state = grapStates.hookedWall;
				audio_play_sound(sndGrappleHookWall,1,false);
			}
		}
		
		var pos = instance_place(x,y+vsp,oParentJumpThru)
		if pos
		{
			if (place_meeting( x, y+vsp, oParentJumpThru ) && !place_meeting( x, y, oParentJumpThru ) && sign(vsp) != -1)
			{
				while(!place_meeting(x, y+sign(vsp), oParentJumpThru))
				{
				    y = y + sign(vsp);
   
				}
				state = grapStates.hookedWall; hsp = 0; vsp = 0;
				owner.grappleX = x;
				owner.grappleY = y;
				owner.ropeX = owner.x;
				owner.ropeY = owner.y;
				owner.ropeAngleVelocity = 0;
				owner.ropeAngle = point_direction(x,y,owner.x,owner.y);
				owner.ropeLength = point_distance(x,y,owner.x,owner.y);
				grappledTo = pos;
				grappledToOffsetX = x - pos.x;
				grappledToOffsetY = y - pos.y;
				state = grapStates.hookedWall;
				audio_play_sound(sndGrappleHookWall,1,false);
			}
		}
		
		
		//dash
		if (owner.attackBuffer < BUFFER)
		{
			owner.myGrap = -1;
			owner.canGrapple = false;
			owner.state = states.DASH;
			var dir = image_angle;
			owner.hsp = lengthdir_x(20,dir);
			owner.vsp = lengthdir_y(20,dir);
			instance_destroy(self);			
		}
		
		x += hsp * global.deltaMultiplier
		y += vsp * global.deltaMultiplier;

	break;
	
	case grapStates.hookedWall:
		hsp = 0;
		vsp = 0;
		
		//update grapple x and grapple y
		owner.grappleX = x;
		owner.grappleY = y;
		
		x = grappledTo.x + grappledToOffsetX;
		y = grappledTo.y + grappledToOffsetY;
		//if (distance_to_object(owner) <= 12)
		//{
		//	owner.state = states.IDLE;
		//	owner.myGrap = -1;
		//	instance_destroy(self)
			
		//}
	break;
	
	case grapStates.retracting:
	
		var _dir = point_direction(x,y,owner.x,owner.y);
		x += lengthdir_x(owner.grapSpeed,_dir) * global.deltaMultiplier;
		y += lengthdir_y(owner.grapSpeed,_dir) * global.deltaMultiplier;
		angle = _dir + 180
		
		if (distance_to_object(owner) <= 2)
		{
			owner.myGrap = -1;
			owner.canGrapple = false;
			if owner.grounded { owner.state = states.IDLE; }
			else {owner.state = states.AIRBORNE; }
			instance_destroy(self);
		}
	break;
}