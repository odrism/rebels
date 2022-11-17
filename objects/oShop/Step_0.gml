var test = false
for (var i = 0; i < instance_number(oButton); i++;)
{
	with instance_find(oButton,i)	
	{
		if box and active { test = true; }	
	}
}

touchingButton = test;

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