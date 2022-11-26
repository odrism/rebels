// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_shop(){
	//enter shopping state if in range
	var nearest = instance_nearest(x,y,oStore)
	if (mouse_check_button_pressed(mb_left)) and position_meeting(mouse_x,mouse_y,nearest)
	and point_distance(x,y,nearest.x,nearest.y) <= 500 and !collision_line(x,y,nearest.x,nearest.y,oParSolid,true,true)
	{
		state = states.SHOPPING;	
	}
}