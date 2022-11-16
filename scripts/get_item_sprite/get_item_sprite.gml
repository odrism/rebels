// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_item_sprite(){
	switch (currentItem)
	{
		default: itemSprite = sSword; break;
		case items.UNARMED: itemSprite = sFists; break;
		case items.SWORD: itemSprite = sSword; break;
		case items.GUN: itemSprite = sGun; break;
	}
}