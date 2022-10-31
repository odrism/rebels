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
		jumpPress = keyboard_check_pressed(ord("J"));
		jump = keyboard_check(ord("J"));
		grapple = keyboard_check(ord("O"));
		grapplePress = keyboard_check_pressed(ord("O"));
		grappleRelease = keyboard_check_released(ord("O"));
		attack = keyboard_check(ord("K"));
		attackPress = keyboard_check_pressed(ord("K"));
		build = keyboard_check(ord("I"));
		buildPress = keyboard_check_pressed(ord("I"));
		scrollInvLeft = keyboard_check_pressed(ord("Q"));
		scrollInvRight = keyboard_check_pressed(ord("E"));
		special = keyboard_check(ord("U"));
		specialPress = keyboard_check_pressed(ord("U"));
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
		buildPress = gamepad_button_check_pressed(device,gp_face4);
		build = gamepad_button_check(device,gp_face4);
		scrollInvLeft = gamepad_button_check_pressed(device, gp_shoulderl);
		scrollInvRight = gamepad_button_check_pressed(device, gp_shoulderr);
		special = gamepad_button_check(device,gp_face4);
		specialPress = gamepad_button_check_pressed(device,gp_face4);
	}
}