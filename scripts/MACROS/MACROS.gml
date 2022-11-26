// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MACROS(){
	enum states
	{
		IDLE,	
		MOVE,
		JUMP,
		AIRBORNE,
		CROUCH,
		WALL_SLIDE,
		WALL_JUMP,
		ATTACK,
		HITSTUN,
		GRAPPLING,
		GRAPPLE_AIM,
		GRAPPLE_ZOOM,
		BUILDING,
		GRABBED,
		SHOPPING,
		DASH
	}
	
	enum characters
	{
		kami,
		dublin,
		godric,
		angus
	}
	
	#macro BUFFER 5
	#macro DEADZONE 0.4
}
