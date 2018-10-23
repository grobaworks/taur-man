/// @description player movement script
/// @function move(move_speed);
/// @params move_speed frames to move per key press
/// @author drewccannedy

var move_speed = argument0;

if keyboard_check(ord("W")) {
	y -= move_speed;
	return true;
}
if keyboard_check(ord("S")) {
	y += move_speed;
	return true;
}
if keyboard_check(ord("D")) {
	x += move_speed;
	return true;
}
if keyboard_check(ord("A")) {
	x -= move_speed;
	return true;
}
prev_y = y;
prev_x = x;
//if no key was pressed
return false;
