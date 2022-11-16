// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_grapple(){
	if (myGrap = -1) and (grappleBuffer < BUFFER) and (canGrapple)
	{
		var createGrap = instance_create_depth(self.x,y,-200,oGrapplingHook);
		with (createGrap) { 
			angle = other.angle; 
			other.myGrap = id; 
			owner = other.id;
			hsp = lengthdir_x(owner.grapSpeed,angle);
			vsp = lengthdir_y(owner.grapSpeed,angle);
		} 
		grappleAimTimer = 0;
		state = states.GRAPPLING
		audio_play_sound(sndGrappleShoot,device,false);
	}
}