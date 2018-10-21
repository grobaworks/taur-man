/// @desc get input from user
/// @func get_input()
/// @author drewccannedy
if keyboard_check_pressed(ord("H")) {
	global.type = "o_spartan";
	global.other = "o_minotaur";
}

if keyboard_check_pressed(ord("M")) {
	 type = "o_minotaur";
	global.other = "o_spartan";
}