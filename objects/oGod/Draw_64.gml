draw_set_color(c_black)
draw_set_alpha(0.4);
draw_roundrect_ext(0,0,464,32*6.6 + 64,60,60,false);

draw_set_font(fFuturaBold19);
draw_set_alpha(1);
draw_set_color(c_white)
draw_text(32,32*1,"WASD - Move");
draw_text(32,32*2,"Space - Jump");
draw_text(32,32*3,"Q - Drop Item");
draw_text(32,32*4,"E - Toggle Shop");
draw_text(32,32*5,"Left Click - Attack");
draw_text(32,32*6,"Right Click - Special");
draw_text(32,32*7,"Middle Click - Grappling Hook");