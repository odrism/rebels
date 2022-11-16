// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pickup_item(){
	//list of all items player is colliding with
	var who = ds_list_create();
	instance_place_list(self.x,self.y,oItem,who,true);
	if (attackPress) and (ds_list_size(who) > 0)
	{
		if (inventory.slots[inventory.currentSlot] == items.UNARMED)
		{
			var one = ds_list_find_value(who, ds_list_size(who) - 1);
			inventory.slots[inventory.currentSlot] = one.itemType;
			inventory.durability[inventory.currentSlot] = one.durability;
			instance_destroy(one);
		}
		else
		{
			//find next available slot
			var j = inventory.currentSlot
			for (i = 0; i < 5; i++)
			{
				if j > 4 { j = 0 }
				if (inventory.slots[j] == items.UNARMED)
				{
					var one = ds_list_find_value(who, ds_list_size(who) - 1);
					inventory.slots[j] = one.itemType;
					inventory.durability[j] = one.durability;
					instance_destroy(one);	
					inventory.currentSlot = j; //jump to the slot
					exit;
				}
				j ++;
			}
		}
	}	
}