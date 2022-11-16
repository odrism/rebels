if (oPlayer.state == states.SHOPPING) { active = true; }
else { active = false; }

mouseGuiX = device_mouse_x_to_gui(0)
mouseGuiY = device_mouse_y_to_gui(0)
ww = sprite_get_width(sprite_index)
hh = sprite_get_height(sprite_index)
box = point_in_rectangle(mouseGuiX,mouseGuiY,xx,yy,xx+ww,yy+hh)

if box
{
	image_index = 1
}
else
{
	image_index = 0;	
}