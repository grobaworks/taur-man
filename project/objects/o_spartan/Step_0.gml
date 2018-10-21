/// @description Things that happen per step
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/// @description Animation code
/// @author mstrack

if !keyboard_check_pressed(ord("D") && ord("A")) {
	if global.spartanFacing == 1 {
		sprite_index = spr_rightidle;
	}
	else if global.spartanFacing == 0 {
		sprite_index = spr_leftidle;
	}
}

if keyboard_check_pressed(ord("D")) {
	sprite_index = spr_rightwalk;
	global.spartanFacing = 1;
}
if keyboard_check_pressed(ord("A")) {
	sprite_index = spr_leftwalk;
	global.spartanFacing = 0;
}