/// @description returns the result of the post request to the server based on the field passed in
/// @function process_get(map, field);
/// @params map the map to retrieve data from
/// @params field the field to access from the map
/// @author drewccannedy
function process_get(argument0, argument1) {
	var map = argument0;
	var field = argument1;

	if ds_map_exists(map, field) {
		return map[? field];

	}
	//if there was no specified field
	return false;


}
