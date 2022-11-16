

if (owner.state == states.GRAPPLING) and (owner.myGrap.state == grapStates.hookedWall)
{
	image_angle = owner.ropeAngle+90 + owner.ropeAngleVelocity
	x = owner.x + xOffset
	y = owner.y + yOffset

}
else
{
	image_angle = 0;
	x = owner.x + xOffset
	y = owner.y + yOffset
}