/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !keyboard_check(ord("D") && ord("A")) {
    if minotaurFacing == 1 {
        sprite_index = spr_mRightIdle;
    }
    else if minotaurFacing == 0 {
        sprite_index = spr_mLeftIdle;
    }
}

if keyboard_check(ord("D")) {
    sprite_index = spr_mRightWalk;
    minotaurFacing = 1;
}
if keyboard_check(ord("A")) {
    sprite_index = spr_mLeftWalk;
    minotaurFacing = 0;
}

