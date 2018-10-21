/// @description camera step

if global.type == "o_spartan" {
     follow_object = global.human;
}

if global.type == "o_minotaur" {
	follow_object = global.taur;
}

if follow_object {
	x = follow_object.x;
	y = follow_object.y;
}

