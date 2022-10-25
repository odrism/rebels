///initialize variables
depth = -100;
state = states.IDLE;

//move vars
defaultGrav = 0.75;
hsp = 0;
vsp = 0;
jumpForce = 21;
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

//grappling hook
myGrap = -1;
grapSpeed = 32;
canGrapple = true;

//draw vars
facing = 1;
angle = 0;

//timer
wallJumpTimer = 0;

//max times
wallJumpTime = 6;

//buffer
jumpBuffer = BUFFER;
grappleBuffer = BUFFER;
coyoteTime = BUFFER;