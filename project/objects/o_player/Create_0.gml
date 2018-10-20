/// @description initialize player
type = "";//init in o_game

show_debug_message("player created");

move_speed = 10;

// frames/request_speed = requests/sec
request_speed = 10;
counter = 0;

//init server with player starting pos
if global.type == type {
	post_movement(x, y);
}
