///initialize variables 
depth = -500;
state = states.IDLE;
weight = 88; //kami 88 dublin 108 godric 78 angus 138
weight *= 0.01;
device = -1
gamepad_set_axis_deadzone(4,DEADZONE);
tapJump = false;
player_controls();
character = characters.kami;

inventory = instance_create_depth(x,y,-100,oInventory);
with inventory { owner = other.id; }

myShop = instance_create_depth(x,y,0,oShop);
with myShop { owner = other.id; }

currentItem = items.UNARMED;
itemSprite = sFists;

//move vars
defaultGrav = 0.75;
hsp = 0;
vsp = 0;
hspFraction = 0;
vspFraction = 0;
jumpForce = 24;
moveSpeed = 10;
accel = 2;
airSpeed =moveSpeed - 2;
airAccel = 0.1
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
jumpRelease = false;
grapple = false;
grapplePress = false;
grappleRelease = false;
attack = false;
attackPress = false;
shop = false;
shopPress = false;
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
grapMaxLength = 640;

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
hurtbox = hurtbox_create(1,1,0,0);
with (hurtbox) { sprite_index = sPlayerHitbox; }
hitbox = ds_list_create()
hit = 0;
hitBy = -1;

//draw vars
facing = 1;
angle = 0;

//timer
wallJumpTimer = 0;
grappleAimTimer = 0;
dashTimer = 0;

//max times
wallJumpTime = 6;
grappleAimTime = 180;
dashTime = 8;

//buffer
jumpBuffer = BUFFER;
grappleBuffer = BUFFER;
coyoteTime = BUFFER;
attackBuffer = BUFFER;
specialBuffer = BUFFER;


