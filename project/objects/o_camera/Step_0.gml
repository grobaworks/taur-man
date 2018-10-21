/// @description camera step

if global.type == "human" {
     follow_object = global.human;
}

if global.type == "taur" {
	follow_object = global.taur;
}

if follow_object {
	x = follow_object.x;
	y = follow_object.y;
}

