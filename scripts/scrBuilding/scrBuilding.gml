// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrBuilding(){
	//gravity
	if (vsp < maxFallSpeed) vsp += defaultGrav;

	//change facing
	if (move != 0)
	{
		facing = sign(move)
	}

	//move
	hsp = approach(hsp, moveSpeed * move, accel);
	
	//variable jump height
	if ((vsp < 0) && !(jump)) vsp = max(vsp,-jumpForce/4); 
	
	//jump but dont change state
	if ((check_below()) or coyoteTime<BUFFER) and jumpBuffer<BUFFER
	
	{
		vsp = -jumpForce;	
		jumpBuffer = BUFFER;
	}
	
	//change build type
	if (specialPress) and (type == types.SLOPE) { type = types.WALL; }
	else if (specialPress) and (type == types.WALL) { type = types.SLOPE; }
	
	//rotate build
	if scrollInvLeft { buildAngle += 90; }
	if scrollInvRight { buildAngle -= 90; }
	if buildAngle >= 360 { buildAngle = 0}
	if buildAngle < 0 { buildAngle = 270 }
	
	if (move == 1) and (buildAngle == 180) { buildAngle = 0; }
	if (move == -1) and (buildAngle == 0) {buildAngle = 180; }
	
	//exit build state
	if (shopPress)
	{
		state = states.IDLE;	
	}
	
	//cant grapple while building
	canGrapple = false;
	
	#region build
	
	//build right
	if (currentSquare != noone) and (attackBuffer<BUFFER)
	{
		if (currentSquare.buildRight = -1)
		{
			if (type == types.WALL) and (buildAngle == 0)
			{
				with (instance_create_depth(currentSquare.x+sprite_get_width(sSquare)/2,currentSquare.y+sprite_get_height(sSquare)/2,-100,oWall))
				{
					image_angle = other.buildAngle;
					owner = other.id;
					owner.currentSquare.buildRight = id;
					if other.currentSquare.myRight != -1
					{
						other.currentSquare.myRight.buildLeft = id;
					}
					var notTouchingGround = !place_meeting(x,y,oParSolid) and !place_meeting(x,y,oWall) and !place_meeting(x,y,oPlat) and !place_meeting(x,y,oSlope) and !place_meeting(x,y,oParentJumpThru)
					if (notTouchingGround) 
					{ 
						other.currentSquare.buildRight = -1;
						other.currentSquare.myRight.buildLeft = -1;
						instance_destroy(self);
						
					}
				}	
				attackBuffer = BUFFER;
			}
		}
		
		//build left	
		if (currentSquare != noone) and attackBuffer<BUFFER
		{
			if currentSquare.buildLeft = -1
			{
				if (type == types.WALL) and (buildAngle == 180)
				{
					with (instance_create_depth(currentSquare.x+sprite_get_width(sSquare)/2,currentSquare.y+sprite_get_height(sSquare)/2,-100,oWall))
					{
						image_angle = other.buildAngle;
						owner = other.id;
						owner.currentSquare.buildLeft = id;
						if other.currentSquare.myLeft != -1
						{
							other.currentSquare.myLeft.buildRight = id;
						}
						var notTouchingGround = !place_meeting(x,y,oParSolid) and !place_meeting(x,y,oWall) and !place_meeting(x,y,oPlat) and !place_meeting(x,y,oSlope) and !place_meeting(x,y,oParentJumpThru)
						if (notTouchingGround) 
						{ 
							other.currentSquare.buildLeft = -1;
							other.currentSquare.myLeft.buildRight = -1;
							instance_destroy(self);
						}
					}	
					attackBuffer = BUFFER;
				}
			}
		}
		
		//build top
		if (currentSquare != noone) and (attackBuffer<BUFFER)
		{
			if (currentSquare.buildTop = -1)
			{
				if (type == types.WALL) and (buildAngle == 90)
				{
					with (instance_create_depth(currentSquare.x+sprite_get_width(sSquare)/2,currentSquare.y+sprite_get_height(sSquare)/2,-100,oPlat))
					{
						image_angle = other.buildAngle;
						owner = other.id;
						owner.currentSquare.buildTop = id;
						if other.currentSquare.myTop != -1
						{
							other.currentSquare.myTop.buildBottom = id;
						}
						var notTouchingGround = !place_meeting(x,y,oParSolid) and !place_meeting(x,y,oWall) and !place_meeting(x,y,oPlat) and !place_meeting(x,y,oSlope) and !place_meeting(x,y,oParentJumpThru)
						if (notTouchingGround) 
						{ 
							other.currentSquare.buildTop = -1;
							other.currentSquare.myTop.buildBottom = -1;
							instance_destroy(self);
						
						}	
						attackBuffer = BUFFER;
					}
				}
			}	
		}
		
		//build bottom
		if (currentSquare != noone) and (attackBuffer<BUFFER)
		{
			if (currentSquare.buildBottom = -1)
			{
				if (type == types.WALL) and (buildAngle == 270)
				{
					with (instance_create_depth(currentSquare.x+sprite_get_width(sSquare)/2,currentSquare.y+sprite_get_height(sSquare)/2,-100,oPlat))
					{
						image_angle = other.buildAngle;
						owner = other.id;
						owner.currentSquare.buildBottom = id;
						if other.currentSquare.myBottom != -1
						{
							other.currentSquare.myBottom.buildTop = id;
						}
						var notTouchingGround = !place_meeting(x,y,oParSolid) and !place_meeting(x,y,oWall) and !place_meeting(x,y,oPlat) and !place_meeting(x,y,oSlope) and !place_meeting(x,y,oParentJumpThru)
						var inGround = false
						if (notTouchingGround) or (inGround)
						{ 
							other.currentSquare.buildBottom = -1;
							other.currentSquare.myBottom.buildTop = -1;
							instance_destroy(self);
						
						}	
						attackBuffer = BUFFER;
					}
				}
			}	
		}
	}

	#endregion
}