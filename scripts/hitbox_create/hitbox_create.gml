// Prioritizes hitboxes by last created. The last one you create will have the highest priority
/// @param {Id.Instance}     xscale
/// @param {Id.Instance}     yscale
/// @param {Id.Instance}     xoffset
/// @param {Id.Instance}     yoffset
/// @param {Id.Instance}     life
/// @param {Id.Instance}     xhitforce
/// @param {Id.Instance}     yhitforce
/// @param {Id.Instance}     hitstun
function hitbox_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7){
	_hitbox = instance_create_layer(x,y,"Boxes",oHitbox);
	_hitbox.owner = id;
	_hitbox.depth = depth-1;
	_hitbox.image_xscale = argument0;
	_hitbox.image_yscale = argument1;
	_hitbox.xOffset = argument2;
	_hitbox.yOffset = argument3;
	_hitbox.life = argument4;
	_hitbox.xHit = argument5;
	_hitbox.yHit = argument6;
	_hitbox.hitstun = argument7;
	ds_list_add(hitbox,_hitbox);

	return _hitbox;
}