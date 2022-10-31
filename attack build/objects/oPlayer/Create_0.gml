///initialize variables 
depth = -500;
state = states.IDLE;
device = -1
gamepad_set_axis_deadzone(4,DEADZONE);

//move vars
defaultGrav = 0.75;
hsp = 0;
vsp = 0;
hspFraction = 0;
vspFraction = 0;
jumpForce = 23;
moveSpeed = 9.5;
accel = 2;
airSpeed =8;
airAccel = 0.6
fric = 1;
grounded = true;
maxFallSpeed = 20;

//controls
left = false;
right = false;
up = false;
down = false;
jump = false;
jumpPress = false;
grapple = false;
grapplePress = false;
grappleRelease = false;
attack = false;
attackPress = false;
build = false;
buildPress = false;
scrollInvLeft = false;
scrollInvRight = false;
special = false;
specialPress = false;

//grappling hook
myGrap = -1;
grapSpeed = 26;
canGrapple = true;
grappleX = 0;
grappleY = 0;
ropeX = 0;
ropeY = 0;
ropeAngleVelocity = 0;
ropeAngle = 0;
ropeLength = 0;

//building vars
r = -1;
c = -1;
enum types
{
	PLAT,
	WALL,
	SLOPE
}
type = types.WALL;
currentSquare = -1; //the current square the player is standing on

//hitbox vars
hurtbox = hurtbox_create(64,126,-32,-126);
hitbox = ds_list_create()
hit = 0;
hitBy = -1;

//draw vars
facing = 1;
angle = 0;

//timer
wallJumpTimer = 0;
grappleAimTimer = 0;

//max times
wallJumpTime = 6;
grappleAimTime = 180;

//buffer
jumpBuffer = BUFFER;
grappleBuffer = BUFFER;
coyoteTime = BUFFER;
attackBuffer = BUFFER;
buildBuffer = BUFFER;

