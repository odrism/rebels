// get angle of keyboard or c-stick
function get_angle(){
	if (right and !left and !up and !down) angle = 0
	if (left and !right and !up and !down) angle = 180
	if (up and !left and !right and !down) angle = 90
	if (up and left and !right and !down) angle = 135
	if (left and down and !right and !up) angle = 225
	if (down and !left and !right and !up) angle = 270
	if (down and right and !left and !up) angle = 315
		if (right and up and !left and !down) angle = 45
	//if (!down and !right and !left and !up and facing == 1) angle = 0;
	//if (!down and !right and !left and !up and facing == -1) angle = 180;
}