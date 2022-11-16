// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function navigate_inv(){
	if (one) { inventory.currentSlot = 0; currentItem = inventory.slots[0];}
	if (two) { inventory.currentSlot = 1; currentItem = inventory.slots[1];}
	if (three) { inventory.currentSlot = 2; currentItem = inventory.slots[2];}
	if (four) { inventory.currentSlot = 3; currentItem = inventory.slots[3];}
	if (five) { inventory.currentSlot = 4; currentItem = inventory.slots[4];}
	
	//nav with scroll wheel
	if (mouse_wheel_up()) { inventory.currentSlot --;  }
	if (mouse_wheel_down()) { inventory.currentSlot ++; }
	if (inventory.currentSlot < 0) { inventory.currentSlot = 4; }
	if (inventory.currentSlot > 4) { inventory.currentSlot = 0; }

}