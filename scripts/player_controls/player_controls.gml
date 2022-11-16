// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_controls(){
	if (device == -1)
	{
		///get player input
		left = keyboard_check(ord("A"));
		right = keyboard_check(ord("D"));
		up = keyboard_check(ord("W"));
		down = keyboard_check(ord("S"));
		jumpPress = keyboard_check_pressed(vk_space) or (tapJump and keyboard_check_pressed(ord("W")));
		jump = keyboard_check(vk_space) or (tapJump and keyboard_check(ord("W")));
		jumpRelease = keyboard_check_released(vk_space) or (tapJump and keyboard_check_released(ord("W")))
		grapple = mouse_check_button(mb_middle)
		grapplePress = mouse_check_button_pressed(mb_middle)
		grappleRelease = mouse_check_button_released(mb_middle)
		attack = mouse_check_button(mb_left);
		attackPress = mouse_check_button_pressed(mb_left)
		shop = keyboard_check(ord("E"));
		shopPress = keyboard_check_pressed(ord("E"));
		scrollInvLeft = mouse_wheel_up()
		scrollInvRight = mouse_wheel_down()
		special = mouse_check_button_pressed(mb_right)
		specialPress = mouse_check_button_pressed(mb_right)
		dropPress = keyboard_check_pressed(ord("Q"));
		one = keyboard_check_pressed(ord("1"));
		two = keyboard_check_pressed(ord("2"));
		three = keyboard_check_pressed(ord("3"));
		four = keyboard_check_pressed(ord("4"));
		five = keyboard_check_pressed(ord("5"));
	}
	else 
	{
		left = get_stick_tilt("left","control");
		right = get_stick_tilt("right","control");
		up =get_stick_tilt("up","control");
		down = get_stick_tilt("down","control");
		jumpPress = gamepad_button_check_pressed(device,gp_face1);
		jump = gamepad_button_check(device,gp_face1);
		grapple = gamepad_button_check(device,gp_shoulderlb) or gamepad_button_check(device,gp_shoulderrb);
		grapplePress = gamepad_button_check_pressed(device,gp_shoulderlb) or gamepad_button_check_pressed(device,gp_shoulderrb);
		grappleRelease =gamepad_button_check_released(device,gp_shoulderlb) or gamepad_button_check_released(device,gp_shoulderrb);
		attackPress = gamepad_button_check_pressed(device,gp_face3);
		attack = gamepad_button_check(device,gp_face3);
		shopPress = gamepad_button_check_pressed(device,gp_face4);
		shop = gamepad_button_check(device,gp_face4);
		scrollInvLeft = gamepad_button_check_pressed(device, gp_shoulderl);
		scrollInvRight = gamepad_button_check_pressed(device, gp_shoulderr);
		special = gamepad_button_check(device,gp_face2);
		specialPress = gamepad_button_check_pressed(device,gp_face2);
	}
}