

//if (canGrapple)
//{
//	draw_sprite_ext(sGrapplingHook,0,x+lengthdir_x(64,angle),y+lengthdir_y(64,angle),1,1,angle,c_red,1);
//}

//draw grappling hook rope
if (myGrap != -1)
{
	var chainWidth = sprite_get_width(sRope); 
	var chainLength = point_distance(x,y,myGrap.x,myGrap.y); 
	var chainAngle = degtorad(point_direction(x, y, myGrap.x, myGrap.y)); 

	for(var i = 0; i < chainLength; i += chainWidth) //Run a loop so we draw every chain-segment
	{
	     draw_sprite_ext(sRope, 0, x + ( cos(chainAngle) * i ) + ( cos(chainAngle) * (chainWidth/2) ), (y - ( sin( chainAngle ) * i )) + (sin( chainAngle ) * (chainWidth/2) ), 1, 1, radtodeg(chainAngle), c_white, 1);
	}
}

//draw grappling hook aiming line
else if (state == states.GRAPPLE_AIM)
{
	var _z = 748
	var _x = lengthdir_x(_z,angle);
	var _y = lengthdir_y(_z,angle);
	var instJumpThru = collision_line_point(x,y,x+_x,y+_y,oParentJumpThru,true,true)
	var inst = collision_line_point(x,y,x+_x,y+_y,oCanBeGrappledTo,true,true)
	if (inst[0]) and !((instJumpThru[0]) and (instJumpThru[0].y > y))
	{
		draw_set_color(c_lime);
		draw_line_width(x, y, inst[1], inst[2],3);
	}
	else if (instJumpThru[0]) and (instJumpThru[0].y > y)
	{
		draw_set_color(c_lime);
		draw_line_width(x, y, instJumpThru[1], instJumpThru[2],3);	
	}
	else
	{
		draw_set_color(c_white);
		draw_line_width(x,y,x+_x,y+_y,3);	
	}
	draw_set_color(c_white);
}

//draw self (rotate self if grappling)
if (state == states.GRAPPLING) and (myGrap.state == grapStates.hookedWall)
{
	draw_sprite_ext(sprite_index,image_index,x,y,facing,1,ropeAngle+90,c_white,1);	
}
else
{
	draw_sprite_ext(sprite_index,image_index,x,y,facing,1,0,c_white,1);	
}

draw_text(x+32,y,currentSquare)
draw_text(x+32,y+32,vsp)