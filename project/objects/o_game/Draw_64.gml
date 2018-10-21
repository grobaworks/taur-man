/// @description win or lose states
/// @author drewccannedy
var text = "";

if not instance_exists(global.human) {
	if global.type == "o_spartan" {
		text = "You lose!";
	} else text = "You win!";
}
if not instance_exists(treasure) {
	if global.type == "o_spartan" {
		text = "You Win!";
	} else text = "You lose!";
}

var x_pos = global.camera.x + 32
var y_pos = global.camera.y + 32
draw_text(x_pos, y_pos, text);