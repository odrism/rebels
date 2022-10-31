draw_self();
draw_text(x,y,ds_list_size(hitbox));

if (canGrapple)
{
	draw_sprite_ext(sGrapplingHook,0,x+lengthdir_x(64,angle),y+lengthdir_y(64,angle)-(sprite_get_height(sprite_index)/2),1,1,angle,c_red,1);
}

if (myGrap != -1)
{
	draw_line(x,y-sprite_get_height(sprite_index)/2,myGrap.x,myGrap.y	)
}
else if (state == states.GRAPPLE_AIM)
{
	var _z = grapSpeed * 24
	var _x = lengthdir_x(_z,angle);
	var _y = lengthdir_y(_z,angle);
	draw_line(x,y-(sprite_get_height(sprite_index)/2),x+_x,y+_y-(sprite_get_height(sprite_index)/2));	
}

