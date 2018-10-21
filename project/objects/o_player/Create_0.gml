/// @description initialize player
name = object_get_name(object_index);
show_debug_message(name + " created");

move_speed = 5;

// frames/request_speed = requests/sec
request_speed = 10;
counter = 0;

//init server with player starting pos
if global.type == object_get_name(object_index) {
	post_movement(x, y);
}
