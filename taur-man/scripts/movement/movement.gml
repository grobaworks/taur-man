
function do_movement(
		_velocity, 
		_idle_sprite, 
		_horiz_movement_sprite, 
		_down_movement_sprite,
		_up_movement_sprite,
		_up_key, 
		_down_key,
		_right_key, 
		_left_key)
{
	// default keys
	if (is_undefined(_up_key)) _up_key = vk_up;
	if (is_undefined(_down_key)) _down_key = vk_down;
	if (is_undefined(_right_key)) _right_key = vk_right;
	if (is_undefined(_left_key)) _left_key = vk_left;
	
	var x_vel = 0;
    var y_vel = 0;
	var scale_flip = 1;

    // check keyboard events
    var is_up = keyboard_check(_up_key);   
    var is_down = keyboard_check(_down_key);
    var is_right = keyboard_check(_right_key);
    var is_left = keyboard_check(_left_key);    
    
    // Set x/y velocity based on direction of keys
    if (is_up) y_vel = -1;
    if (is_down) y_vel = 1;
    if (is_right) x_vel = 1;
    if (is_left) x_vel = -1;
	
	// sprite updates
	if (is_left) scale_flip = -1;
	if (is_down) sprite_index = _down_movement_sprite;
	if (is_left || is_right) sprite_index = _horiz_movement_sprite;
	if (is_up) sprite_index = _up_movement_sprite;
	if (!(is_left || is_right || is_up || is_down)) sprite_index = _idle_sprite;
	
	// sprite scaling based on background and if the player is left/right facing
	image_xscale = room_width / sprite_get_width(back_maze) * scale_flip;
	image_yscale = room_height / sprite_get_height(back_maze);
	image_speed = .25;

    // proposed new position
    var new_x = x + x_vel * _velocity;
    var new_y = y + y_vel * _velocity;
    // update position if free
    if (place_free(new_x, new_y)) {
        x = new_x;
        y = new_y;
    } else if (place_free(new_x, y)) {
        x = new_x; // update the x, if the y isn't free
    } else if (place_free(x, new_y)) {
        y = new_y; // update the y, if the x isn't free
    } else {
        // nothing free.
    }
}