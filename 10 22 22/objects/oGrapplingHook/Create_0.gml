enum grapStates
{
	flying,
	hookedWall,
	retracting
}

angle = 0;
hsp = 0;
vsp = 0;
owner = 0;
maxLifetime = 24

state = grapStates.flying;
lifetime = 0;

//grapple aim idle, move and air
//are like a slow mode and can be
//cancelled with attack button