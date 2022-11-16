// get angle of keyboard or c-stick
function get_angle(){
	if (device == -1)
	{
		angle = point_direction(x,y,mouse_x,mouse_y)
	}
	else
	{
		var haxis = gamepad_axis_value(device,gp_axislh);
		var vaxis = gamepad_axis_value(device,gp_axislv);
		angle = point_direction(0,0,haxis,vaxis);
		angle = (round(angle/10)) * 10
		if (abs(haxis) < DEADZONE) and (abs(vaxis) < DEADZONE) 
		{  
			if (facing = 1) angle = 0
			else if (facing = -1) angle = 180
		}
	}
}