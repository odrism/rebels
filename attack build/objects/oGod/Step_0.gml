if (keyboard_check(vk_shift))
{
	room_speed = 5
}
else
{
	room_speed = 60;
}

camera_set_view_pos(view_camera[0],oPlayer.x-(1980/2),oPlayer.y-(1080/2));

//change build angle
if (oPlayer.state = states.BUILDING)
{
	if oPlayer.scrollInvLeft { buildAngle += 90; }
	if oPlayer.scrollInvRight { buildAngle -= 90; }
	if buildAngle >= 360 { buildAngle = 0}
	if buildAngle < 0 { buildAngle = 270 }
	
	if (oPlayer.move == 1) and (buildAngle == 180) { buildAngle = 0; }
	if (oPlayer.move == -1) and (buildAngle == 0) {buildAngle = 180; }	
}