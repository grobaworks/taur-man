/// @description receive instance id
if not id_found {
	var map = get_map();

	global.http_id = process_get(map, "id");
	show_debug_message("Id is " + string(global.http_id));
	if string_length(global.http_id) == 24 id_found = true;
}