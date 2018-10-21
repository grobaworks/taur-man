/// @description use http_get results

var json = async_load[? "result"]
if json == undefined exit;
var map = json_decode(json);
if (map == -1){
	show_debug_message("request failed");
	exit;
}
//grab positions from server
if global.type != name {
	newX = process_get(map, global.other + "X");
	newY = process_get(map, global.other + "Y");
	
	if newX x = newX;
	if newY y = newY;
}