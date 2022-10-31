window_set_fullscreen(true)
r = ceil(room_height / (sprite_get_height(sSquare)))
c = ceil(room_width / (sprite_get_width(sSquare)))
size = sprite_get_width(sSquare);
ROW = -1;
COL = -1;
buildAngle = 0;

type = types.PLAT;


array[r-1][c-1] = 0;

for (i = 0; i < c; i++)
{
	for (j = 0; j < r; j++)
	{
		 var square = instance_create_depth((size*i),(size*j),1,oSquare);
		 with (square)
		 {
			other.array[other.j][other.i] = id; 
			god = other.id
			r = other.j;
			c = other.i;
		 }
	}
}

depth = -100000