for (i = 0; i < 5; i++)
{
	var ii = i - 2;
	var xx = display_get_gui_width()/2-sprite_get_width(sInventorySlots)/2+(128*ii)+32
	var yy = display_get_gui_height() - 192;

	//draw slots
	draw_sprite(sInventorySlots,i,xx,yy);	
	
	//draw cursor
	if (i == currentSlot)
	{
		draw_sprite(sCursor,i,xx,yy);	
	}
	
	//draw item
	if (slots[i] != items.UNARMED)
	{
		draw_sprite(sItem,slots[i],xx,yy);
	}	
}
