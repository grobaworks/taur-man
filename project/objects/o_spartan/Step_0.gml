/// @description Animation code
/// @author mstrack

if !keyboard_check_pressed(ord("D") && ord("A")) {
    if spartanFacing == 1 {
        sprite_index = spr_rightidle;
    }
    else if spartanFacing == 0 {
        sprite_index = spr_leftidle;
    }
}

if keyboard_check_pressed(ord("D")) {
    sprite_index = spr_rightwalk;
    spartanFacing = 1;
}
if keyboard_check_pressed(ord("A")) {
    sprite_index = spr_leftwalk;
    spartanFacing = 0;
}

