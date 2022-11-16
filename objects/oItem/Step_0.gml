vsp = vsp + 0.5; //gravity

#region collision
hsp += hspFraction;
vsp += vspFraction;
hspFraction = frac(hsp);
vspFraction = frac(vsp);
hsp -= hspFraction;
vsp -= vspFraction;

//horizontal
if (place_meeting(x+hsp * global.deltaMultiplier,y,oParSolid))
{
	var _hStep = sign(hsp);
	var yplus = 0;
	while (place_meeting(x+hsp * global.deltaMultiplier,y-yplus,oParSolid) and yplus <= abs(2*hsp)) yplus ++;
	if place_meeting(x+hsp * global.deltaMultiplier,y-yplus,oParSolid)
	{
		hsp = 0;
		hspFraction = 0;
		while(!place_meeting(x+_hStep,y,oParSolid)) x += _hStep * global.deltaMultiplier;	
	}
	else
	{
		y -= yplus	
	}
}

x += hsp * global.deltaMultiplier;



if !place_meeting(x,y,oParSolid) && vsp >= 0 && place_meeting(x,y+2+abs(hsp) * global.deltaMultiplier,oParSolid)
{while(!place_meeting(x,y+1 * global.deltaMultiplier,oParSolid)) {y += 1;}}

//vertical
if (place_meeting(x,y+vsp * global.deltaMultiplier,oParSolid))
{
	var _vStep = sign(vsp);
	vsp = 0;
	hsp = 0;
	vspFraction = 0;
	while(!place_meeting(x,y+_vStep,oParSolid)) y += _vStep;	
}

//jump thru
var jumpThru = (instance_place( x, y+vsp * global.deltaMultiplier, oParentJumpThru ))

if (jumpThru != noone)
{
	if !place_meeting( x, y, jumpThru ) && sign(vsp) != -1
	{
		var _vStep = sign(vsp);
		vsp = 0;
		hsp = 0;
		vspFraction = 0;
		grounded = true
		while(!place_meeting(x,y+_vStep,jumpThru)) y += _vStep * global.deltaMultiplier;	
	}
}

y += vsp * global.deltaMultiplier;
#endregion