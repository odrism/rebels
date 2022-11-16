// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drop_item(){
	if (dropPress) and (inventory.slots[inventory.currentSlot] != items.UNARMED)
	{
		var cr = instance_create_depth(x,y,-100000,oItem)
		with (cr)
		{
			y -= 64
			var dir = point_direction(other.x,other.y,mouse_x,mouse_y);
			hsp = lengthdir_x(11,dir)
			vsp = lengthdir_y(11,dir)
			image_index = other.inventory.slots[other.inventory.currentSlot]; //set sprite for item
			durability = other.inventory.durability[other.inventory.currentSlot] //set item's durability
			itemType = other.inventory.slots[other.inventory.currentSlot]; //set item type
			other.inventory.slots[other.inventory.currentSlot] = items.UNARMED; //set held item to unarmed
			other.inventory.durability[other.inventory.currentSlot] = -1; //set durability to -1
		}	
	}
}