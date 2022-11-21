//this determines if the mouse is over any category button.
//have to do it like this because buttons are drawn on gui
var test = false
for (var i = 0; i < instance_number(oButton); i++;)
{
	with instance_find(oButton,i)	
	{
		if box and active { test = true; }	
	}
}

touchingButton = test;

//if you're not touching a category button, the text should show the selected category
if !(touchingButton)
{
	switch (category)
	{
		case categories.throwing:
			categoryStr = "THROWING"
		break;
		case categories.angus:
			categoryStr = "ANGUS"
		break;
		case categories.boon:
			categoryStr = "BOON"
		break;
		case categories.defense:
			categoryStr = "DEFENSE"
		break;
		case categories.dublin:
			categoryStr = "DUBLIN"
		break;
		case categories.environmental:
			categoryStr = "ENVIRONMENTAL"
		break;
		case categories.explosive:
			categoryStr = "EXPLOSIVE"
		break;
		case categories.farming:
			categoryStr = "FARMING"
		break;
		case categories.godric:
			categoryStr = "GODRIC"
		break;
		case categories.kami:
			categoryStr = "KAMI"
		break;
		case categories.materials:
			categoryStr = "MATERIALS"
		break;
		case categories.utility:
			categoryStr = "UTILITY"
		break;
	}	
}

//toggle layers depending on category variable
switch (category)
{
	case categories.throwing:
		deactivate_shop_layers();
		instance_activate_layer("Throwing")
	break;
	
	case categories.explosive:
		deactivate_shop_layers();
		instance_activate_layer("Explosive")
	break;
	
	case categories.boon:
		deactivate_shop_layers();
		instance_activate_layer("Boon")
	break;
	
	case categories.utility:
		deactivate_shop_layers();
		instance_activate_layer("Utility")
	break;
	
	case categories.environmental:
		deactivate_shop_layers();
		instance_activate_layer("Environmental")
	break;
	
	case categories.defense:
		deactivate_shop_layers();
		instance_activate_layer("Defense")
	break;
	
	case categories.materials:
		deactivate_shop_layers();
		instance_activate_layer("Materials")
	break;
	
	case categories.farming:
		deactivate_shop_layers();
		instance_activate_layer("Farming")
	break;
	
	case categories.kami:
		deactivate_shop_layers();
		instance_activate_layer("Kami")
	break;
	
	case categories.dublin:
		deactivate_shop_layers();
		instance_activate_layer("Dublin")
	break;
	
	case categories.godric:
		deactivate_shop_layers();
		instance_activate_layer("Godric")
	break;
	
	case categories.angus:
		deactivate_shop_layers();
		instance_activate_layer("Angus")
	break;

	default:
		deactivate_shop_layers();
	break;
}