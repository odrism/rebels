xx = x- camera_get_view_x(view_camera[0])
yy = y- camera_get_view_y(view_camera[0])
mouseGuiX = device_mouse_x_to_gui(0)
mouseGuiY = device_mouse_y_to_gui(0)
ww = sprite_get_width(sprite_index) * image_xscale
hh = sprite_get_height(sprite_index) * image_yscale
box = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+ww,yy+hh)

active = false;

squareIndex = irandom_range(0,4);
myCategory = 0;