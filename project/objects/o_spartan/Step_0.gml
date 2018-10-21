/// @description Animation code
/// @author mstrack

event_inherited();

if global.type == "o_minotaur" {
	torch.sprite_index = 2;	
}

if !keyboard_check(ord("D") && ord("A")) {
    if spartanFacing == 1 {
        sprite_index = spr_rightidle;
    }
    else if spartanFacing == 0 {
        sprite_index = spr_leftidle;
    }
}

if keyboard_check(ord("D")) {
    sprite_index = spr_rightwalk;
    spartanFacing = 1;
}
if keyboard_check(ord("A")) {
    sprite_index = spr_leftwalk;
    spartanFacing = 0;
}

