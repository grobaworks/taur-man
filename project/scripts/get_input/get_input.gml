/// @desc get input from user
/// @func get_input()
/// @author drewccannedy
if keyboard_check_pressed(ord("H")) {
	global.type = "o_spartan";
	global.other = "o_minotaur";
}

if keyboard_check_pressed(ord("M")) {
	global.type = "o_minotaur";
	global.other = "o_spartan";
}
if keyboard_check_pressed(ord("P")){
	instance_creator = true;	
}