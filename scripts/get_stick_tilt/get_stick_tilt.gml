function get_stick_tilt(argument0, argument1) {
    if (argument1 == "control")
    {
        if (argument0 == "left")
        {
            return abs(min(gamepad_axis_value(device,gp_axislh),0));
        }

        if (argument0 == "right")
        {
            return max(gamepad_axis_value(device,gp_axislh),0);
        }

        if (argument0 == "up")
        {
            return abs(min(gamepad_axis_value(device,gp_axislv),0));
        }

        if (argument0 == "down")
        {
            return max(gamepad_axis_value(device,gp_axislv),0);
        }
    }
    if (argument1 == "c")
    {
        if (argument0 == "left")
        {
            return abs(min(gamepad_axis_value(device,gp_axisrh),0));
        }

        if (argument0 == "right")
        {
            return max(gamepad_axis_value(device,gp_axisrh),0);
        }

        if (argument0 == "up")
        {
            return abs(min(gamepad_axis_value(device,gp_axisrv),0));
        }

        if (argument0 == "down")
        {
            return max(gamepad_axis_value(device,gp_axisrv),0);
        }
    }


}