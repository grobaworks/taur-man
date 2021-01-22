/// @description returns the map gotten from async http
/// @function get_map()
function get_map() {

	var json = async_load[? "result"]
	if json == undefined exit;
	var map = json_decode(json);
	if (map == -1){
		show_debug_message("request failed");
		exit;
	}
	return map;


}
