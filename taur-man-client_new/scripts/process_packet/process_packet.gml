/// @function process_packet(buffer, socket);
/// @param buffer The contents of the packet
/// @param socket The id of the client
function process_packet(_buffer){
	var nsgid = buffer_read(_buffer, buffer_u8);
	
	switch(nsgid) {
		case network.move:
			var socket = buffer_read(_buffer, buffer_u8);
			var move_x = buffer_read(_buffer, buffer_u16);
			var move_y = buffer_read(_buffer, buffer_u16);
			
			var player = ds_map_find_value(socket_to_instance, socket);
			
			obj_player.x = move_x;
			obj_player.y = move_y;
			break;
		case network.player_joined:
			var socket = buffer_read(_buffer, buffer_u8);
			var starting_x = buffer_read(_buffer, buffer_u16);
			var starting_y = buffer_read(_buffer, buffer_u16);
			var slave = instance_create_depth(starting_x, starting_y, depth, obj_player);
			slave.socket = socket;
			ds_map_add(socket_to_instance, socket, slave);
			break;
		case network.player_connect:
			var socket = buffer_read(_buffer, buffer_u8);
			var starting_x = buffer_read(_buffer, buffer_u16);
			var starting_y = buffer_read(_buffer, buffer_u16);
			var player = instance_create_depth(starting_x, starting_y, depth, obj_player);
			player.socket = socket;
			ds_map_add(socket_to_instance, socket, player);
			break;
		case network_type_disconnect:
			var socket = buffer_read(_buffer, buffer_u8);
			var player = ds_map_find_value(socket_to_instance, socket);
			
			with(player) {
				instance_destroy();	
			}
			
			ds_map_delete(socket_to_instance, socket);
			
			break;
	}
	
}