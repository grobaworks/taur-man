/// @function process_packet(buffer, socket);
/// @param buffer The contents of the packet
/// @param socket The id of the client
function process_packet(_buffer, _socket){
	var nsgid = buffer_read(_buffer, buffer_u8);
	
	switch(nsgid) {
		case network.move:
			var move_x = buffer_read(_buffer, buffer_u16);
			var move_y = buffer_read(_buffer, buffer_u16);
			
			var player = ds_map_find_value(socket_to_instance, _socket)
			player.x = move_x;
			player.x = move_y;
		
			var i = 0;
			repeat(ds_list_size(client_socket_list)){
				var current_socket = ds_list_find_value(client_socket_list, i);
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