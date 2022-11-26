if (oPlayer.state = states.BUILDING)
{
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,0.4);
	if (position_meeting(mouse_x,mouse_y,self))
	{	
		if (oPlayer.type = types.WALL)
		{
			draw_sprite_ext(sWall,0,x+sprite_get_width(sSquare)/2,y+sprite_get_height(sSquare)/2,1,1,oPlayer.buildAngle,c_white,0.4);
		}
		if (oPlayer.type = types.SLOPE)
		{
			//if (oPlayer.angle = 180)
				//draw_sprite_ext(sSlope,0,x+sprite_get_width(sSquare)/2,y+sprite_get_height(sSquare)/2,1,1,oPlayer.buildAngle,c_white,0.4);
			//else
				//draw_sprite_ext(sSlope,1,x+sprite_get_width(sSquare)/2,y+sprite_get_height(sSquare)/2,1,1,oPlayer.buildAngle,c_white,0.4);
		}
	}
}

draw_point(centerX,centerY);