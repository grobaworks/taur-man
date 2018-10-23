/// @description update the calling object's sprite
/// @function update_sprite()
/// @author drewccannedy

var r_idle;
var l_idle;
var r_walk;
var l_walk;

if name == "o_spartan" {
	r_idle = spr_rightidle;
	l_idle = spr_leftidle;
	r_walk = spr_rightwalk;
	l_walk = spr_leftwalk;
} else {
	r_idle = spr_mRightIdle;
	l_idle = spr_mLeftIdle;
	r_walk = spr_mRightWalk;
	l_walk = spr_mLeftWalk;
}

if prev_x == x and prev_y = y {
    if facing == 1 {
        sprite_index = r_idle;
    }
    else if facing == 0 {
        sprite_index = l_idle;
    }
}

if prev_x < x {
    sprite_index = r_walk;
    facing = 1;
}
if prev_x > x {
    sprite_index = l_walk;
    facing = 0;
}
if prev_y < y or prev_y > y {
	if facing == 1 {
        sprite_index = r_walk;
    }
    else if facing == 0 {
        sprite_index = l_walk;
    }	
}