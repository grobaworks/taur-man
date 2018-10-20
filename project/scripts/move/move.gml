/// @description player movement script
/// @function move(move_speed);
/// @params move_speed frames to move per key press

var move_speed = argument0;

if keyboard_check_pressed(ord("W")) {
	y -= move_speed;
	return true;
}
if keyboard_check_pressed(ord("S")) {
	y += move_speed;
	return true;
}
if keyboard_check_pressed(ord("D")) {
	x += move_speed;
	return true;
}
if keyboard_check_pressed(ord("A")) {
	x -= move_speed;
	return true;
}
//if no key was pressed
return false;
