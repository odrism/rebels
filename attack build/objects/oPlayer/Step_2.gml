check_hit();

//get hit
if(hit){

    hsp = hitBy.xHit;
	vsp = hitBy.yHit;
    hitstun = hitBy.hitstun;
    facing = hitBy.owner.facing * -1;
    hit = false;
    states = states.HITSTUN;
}