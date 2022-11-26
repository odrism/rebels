if (c > 0) myLeft = god.array[r][c-1]
else myLeft = -1;

if (c < array_length(god.array[0])-1) myRight = god.array[r][c+1]
else myRight = -1;

if (r > 0) myTop = god.array[r-1][c]
else myTop = -1;

if (r < array_length(god.array)-1) myBottom = god.array[r+1][c]
else myBottom = -1;


if (position_meeting(oPlayer.x,oPlayer.y,self))
{
	oPlayer.r = r;
	oPlayer.c = c;
}