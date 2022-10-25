draw_self();
draw_text(self.x+32,self.y+32,state);

if (canGrapple)
{
	draw_sprite_ext(sGrapplingHook,0,x+lengthdir_x(64,angle),y+lengthdir_y(64,angle)-(sprite_get_height(sprite_index)/2),1,1,angle,c_red,1);
}

if (myGrap != -1)
{
	draw_line(x,y-sprite_get_height(sprite_index)/2,myGrap.x,myGrap.y	)
}
else if (myGrap == -1) and (grapple) and (canGrapple)
{
	var _z = grapSpeed * 24
	var _x = lengthdir_x(_z,angle);
	var _y = lengthdir_y(_z,angle);
	draw_line(x,y-(sprite_get_height(sprite_index)/2),x+_x,y+_y-(sprite_get_height(sprite_index)/2));	
}