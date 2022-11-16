owner = -1;

enum items
{
	UNARMED,
	SWORD,
	GUN
}
 
slots = [items.SWORD,
		items.GUN,
		items.SWORD,
		items.SWORD,
		items.SWORD];
durability = [-1, 40, 20, -1, -1];
maxDurability = [-1, 40, 20, -1, -1];

currentSlot = 0;
currentItem = slots[0]
depth = -99999