/// @desc get input from user
/// @func get_input()

if keyboard_check_pressed(ord("X")) {
	global.type = "human";
	global.other = "taur";
}

if keyboard_check_pressed(ord("C")) {
	global.type = "taur";
	global.other = "human";
}