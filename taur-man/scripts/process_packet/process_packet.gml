/// @function process_packet(buffer, socket);
/// @param buffer The contents of the packet
/// @param socket The id of the client
function process_client_packet(_input_buffer, _socket){
	var nsgid = buffer_read(_input_buffer, buffer_u8);
	
	switch(nsgid) {
		case network.move:
			var move_x = buffer_read(_input_buffer, buffer_u16);
			var move_y = buffer_read(_input_buffer, buffer_u16);
			
			var player = ds_map_find_value(server_socket_to_instance, _socket)
			player.x = move_x;
			player.x = move_y;
		
			var i = 0;
			repeat(ds_list_size(server_socket_list)){
				var current_socket = ds_list_find_value(server_socket_list, i);
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.move);
				buffer_write(server_buffer, buffer_u8, _socket);
				buffer_write(server_buffer, buffer_u16, move_x);
				buffer_write(server_buffer, buffer_u16, move_y);
				network_send_packet(current_socket, server_buffer, buffer_tell(server_buffer));
			}
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.move);
			buffer_write(server_buffer, buffer_u16, move_x);
			buffer_write(server_buffer, buffer_u16, move_y);
			network_send_packet(_socket, server_buffer, buffer_tell(server_buffer));
			break;
	}
	
}

function process_server_packet(_input_buffer){
var nsgid = buffer_read(_input_buffer, buffer_u8);
	
	switch(nsgid) {
		case network.move:
			var socket = buffer_read(_input_buffer, buffer_u8);
			var move_x = buffer_read(_input_buffer, buffer_u16);
			var move_y = buffer_read(_input_buffer, buffer_u16);
			
			var player = ds_map_find_value(client_socket_to_instance, socket);
			
			obj_player.x = move_x;
			obj_player.y = move_y;
			break;
		case network.player_joined:
			var socket = buffer_read(_input_buffer, buffer_u8);
			var starting_x = buffer_read(_input_buffer, buffer_u16);
			var starting_y = buffer_read(_input_buffer, buffer_u16);
			var slave = instance_create_depth(starting_x, starting_y, depth, obj_player);
			slave.socket = socket;
			ds_map_add(client_socket_to_instance, socket, slave);
			break;
		case network.player_connect:
			var socket = buffer_read(_input_buffer, buffer_u8);
			var starting_x = buffer_read(_input_buffer, buffer_u16);
			var starting_y = buffer_read(_input_buffer, buffer_u16);
			var player = instance_create_depth(starting_x, starting_y, depth, obj_player);
			player.socket = socket;
			ds_map_add(client_socket_to_instance, socket, player);
			break;
		case network_type_disconnect:
			var socket = buffer_read(_input_buffer, buffer_u8);
			var player = ds_map_find_value(client_socket_to_instance, socket);
			
			with(player) {
				instance_destroy();	
			}
			
			ds_map_delete(client_socket_to_instance, socket);
			
			break;
	}
}