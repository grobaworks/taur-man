/// @desc get input from user
/// @func get_input()

if keyboard_check_pressed(ord("S")) {
	instance_create_depth(0, 0, 0, o_server);
}

if keyboard_check_pressed(ord("C")) {
	instance_create_depth(0, 0, 0, o_client);
}