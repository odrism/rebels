if (oPlayer.state == states.SHOPPING)	
{
	draw_shader_blur()
	draw_set_halign(fa_center);
	draw_set_font(fGameria24);
	draw_text(display_get_gui_width()/2,128,categoryStr);
	draw_set_font(fFuturaBold19);
	draw_set_halign(fa_left);
}

	draw_text(display_get_gui_width()/2,32,category);