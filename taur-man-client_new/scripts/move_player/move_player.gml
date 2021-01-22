// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_player(_velocity){
	var xVel = 0;
    var yVel = 0;

    // check keyboard events
    var isUp = keyboard_check(vk_up);   
    var isDown = keyboard_check(vk_down);
    var isRight = keyboard_check(vk_right);
    var isLeft = keyboard_check(vk_left);    
    
    // Set x/y velocity based on direction of keys
    if (isUp) yVel = -1;
    if (isDown) yVel = 1;
    if (isRight) xVel = 1;
    if (isLeft) xVel = -1;

    // proposed new position
    var newX = x + xVel * _velocity;
    var newY = y + yVel * _velocity;
    // update position if free
    if (place_free(newX, newY)) {
        x = newX;
        y = newY;
    } else if (place_free(newX, y)) {
        x = newX; // update the x, if the y isn't free
    } else if (place_free(x, newY)) {
        y = newY; // update the y, if the x isn't free
    } else {
        // nothing free.
    }
}