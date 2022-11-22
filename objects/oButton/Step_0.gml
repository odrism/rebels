if (oPlayer.state == states.SHOPPING) { active = true; }
else { active = false; }

mouseGuiX = device_mouse_x_to_gui(0)
mouseGuiY = device_mouse_y_to_gui(0)
ww = sprite_get_width(sprite_index)
hh = sprite_get_height(sprite_index)
box = point_in_rectangle(mouseGuiX,mouseGuiY,xx,yy,xx+ww,yy+hh)

if box and active
{
	image_index = 1
	//if you're hovering over a category button, switch the shown text to that category for easy identification
	if (oShop.touchingButton)
	{
		switch (myCategory)
		{
			case categories.throwing:
				oShop.categoryStr = "THROWING"
			break;
			case categories.angus:
				oShop.categoryStr = "ANGUS"
			break;
			case categories.boon:
				oShop.categoryStr = "BOON"
			break;
			case categories.defense:
				oShop.categoryStr = "DEFENSE"
			break;
			case categories.dublin:
				oShop.categoryStr = "DUBLIN"
			break;
			case categories.environmental:
				oShop.categoryStr = "ENVIRONMENTAL"
			break;
			case categories.explosive:
				oShop.categoryStr = "EXPLOSIVE"
			break;
			case categories.farming:
				oShop.categoryStr = "FARMING"
			break;
			case categories.godric:
				oShop.categoryStr = "GODRIC"
			break;
			case categories.kami:
				oShop.categoryStr = "KAMI"
			break;
			case categories.materials:
				oShop.categoryStr = "MATERIALS"
			break;
			case categories.utility:
				oShop.categoryStr = "UTILITY"
			break;
		}
	}
}
else
{
	image_index = 0;	
}

if box and mouse_check_button_released(mb_left) and active
{
	oShop.category = myCategory;	
}

if (oShop.category == categories.kami)
{
	instance_activate_layer("Kami");	
}
else
{
	instance_deactivate_layer("Kami");	
}