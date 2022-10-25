// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_below(){
	return (place_meeting(x,y+10,oParSolid) or place_meeting(x,y+1,oParSolid)) or
	(place_meeting( x, y+1, oParentJumpThru ) && !place_meeting( x, y, oParentJumpThru ) && sign(vsp) != -1);
} 