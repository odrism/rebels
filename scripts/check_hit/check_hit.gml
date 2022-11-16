// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_hit(){
	//hitbox
	if(ds_list_size(hitbox)>0){
		for (i = 0; i < ds_list_size(hitbox); i++)
		{
		    with(ds_list_find_value(hitbox,i)){
		        //check to see if the hurtbox is touching your hitbox        
		        with(oHurtbox){
		            if(place_meeting(x,y,other) && other.owner != owner){
		                //ignore check
		                //checking collision from the hitbox object
		                with(other){
		                    //check to see if your target is on the ignore list
		                    //if it is on the ignore list, dont hit it again
		                    for(i = 0; i < ds_list_size(ignoreList); i ++){
		                        if(ignoreList[|i] = other.owner){
		                            ignore = true;
		                            break;
		                        }
		                    }

		                    //if it is NOT on the ignore list, hit it, and add it to
		                    //the ignore list
		                    if(!ignore){
		                        other.owner.hit = true;
		                        other.owner.hitBy = id;
		                        ds_list_add(ignoreList,other.owner);
		                    }
		                }
		            }
		        }
		    }
		}
	}
}