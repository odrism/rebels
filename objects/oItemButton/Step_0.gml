if (oPlayer.state == states.SHOPPING) { active = true; }
else { active = false; }

mouseGuiX = device_mouse_x_to_gui(0)
mouseGuiY = device_mouse_y_to_gui(0)
ww = sprite_get_width(sprite_index) * image_xscale
hh = sprite_get_height(sprite_index) * image_yscale
box = point_in_rectangle(mouseGuiX,mouseGuiY,xx,yy,xx+ww,yy+hh)

if box and active
{
	image_index = 1
	//if you're hovering over a category button, switch the shown text to that category for easy identification
}
else
{
	image_index = 0;	
}