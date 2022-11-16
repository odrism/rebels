// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrShopping(){
	//exit shop mode
	if (shopPress)
	{
		state = states.IDLE;	
	}
	
	//gravity
	if (vsp < maxFallSpeed) vsp += defaultGrav * global.deltaMultiplier;
	
	//approach 0 speed horizontally
	if (grounded)
	{
		hsp = approach(hsp,0,fric);
	}
	else
	{
		hsp = approach(hsp,0,0.1);		
	}
	

}