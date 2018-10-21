/// @description post movement variables to server
/// @function post_movement(x_pos, y_pos)
/// @param x_pos the x cord of the object
/// @param y_pos the y cord of the object

var x_pos = argument0;
var y_pos = argument1;

var final_url = global.url;

//add url arguments depending on if the player is human or taur
// url will look like global.url + /?humanX=123&humanY=123
final_url += "/?" + global.type + "X=" + string(x_pos);
final_url += "&" + global.type + "Y=" + string(y_pos);
//post to server
http_post_string(final_url, "");