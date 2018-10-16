/// @description use http_get results
show_debug_message("Client HTTP async call");
//get result
var json = async_load[? "result"];
show_debug_message("res was " + json);
//convert json to ds_map
var map = json_decode(json);
//if json is bad
if (map == -1){
	show_debug_message("request failed");
	exit;
}

if (ds_map_exists(map, "text")) {
	var text = map[? "text"];
	show_debug_message("text of response was " + text);
}

