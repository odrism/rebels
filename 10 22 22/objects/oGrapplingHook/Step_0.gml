image_angle = angle;


lifetime ++;


switch (state)
{
	case grapStates.flying:
		if lifetime > maxLifetime
		{
			state = grapStates.retracting;	
		}
		
		var yplus = 0;

		if place_meeting(x+hsp,y,oParSolid)
		{
		   
		    if place_meeting(x+hsp,y-yplus,oParSolid)
		    {
		        while (!place_meeting(x+sign(hsp),y,oParSolid)) x+=sign(hsp);
		        state = grapStates.hookedWall; hsp = 0; vsp = 0;
		    }
		    else
		    {
		        y -= yplus
		    }
		}



		//vertical collision
		if (place_meeting(x,y+vsp,oParSolid))
		{
			while(!place_meeting(x,y+sign(vsp),oParSolid))
			{
				y += sign(vsp);
			}
			state = grapStates.hookedWall; hsp = 0; vsp = 0;
		}

		if (place_meeting( x, y+vsp, oParentJumpThru ) && !place_meeting( x, y, oParentJumpThru ) && sign(vsp) != -1)
		{
			while(!place_meeting(x, y+sign(vsp), oParentJumpThru))
			{
		        y = y + sign(vsp);
   
		    }
		    state = grapStates.hookedWall; hsp = 0; vsp = 0;
		}
		
		x += hsp
		y += vsp;

	break;
	
	case grapStates.hookedWall:
		hsp = 0;
		vsp = 0;
		owner.state = states.GRAPPLING;
		
		if (distance_to_object(owner) <= 14)
		{
			owner.state = states.IDLE;
			owner.myGrap = -1;
			instance_destroy(self)
			
		}
	break;
	
	case grapStates.retracting:
	
		var _dir = point_direction(x,y,owner.x,owner.y-sprite_get_height(owner.sprite_index) / 2);
		x += lengthdir_x(owner.grapSpeed,_dir);
		y += lengthdir_y(owner.grapSpeed,_dir);
		angle = _dir + 180
		
		if (distance_to_object(owner) <= 2)
		{
			owner.myGrap = -1;
			owner.canGrapple = true;
			owner.state = states.IDLE;
			instance_destroy(self);
		}
	break;
}