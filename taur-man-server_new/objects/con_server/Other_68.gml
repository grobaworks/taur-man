var type_event = ds_map_find_value(async_load,"type");

// what happened? 
switch(type_event) {
	// client connected
	case network_type_connect:
		// keep track of what client sockets are connected
		var socket = ds_map_find_value(async_load, "socket");
		ds_list_add(client_socket_list, socket);
		
		var player = instance_create_depth(player_spawn_x, player_spawn_y, depth, obj_player)
		ds_map_add(socket_to_instance, socket, player);
		
		buffer_seek(server_buffer, buffer_seek_start, 0);
		buffer_write(server_buffer, buffer_u8, network.player_connect);
		buffer_write(server_buffer, buffer_u8, socket);
		buffer_write(server_buffer, buffer_u16, player.x);
		buffer_write(server_buffer, buffer_u16, player.y);
		network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
		
		// tell the connecting client what players exist
		var i = 0;
		repeat(ds_list_size(client_socket_list)) {
			var current_socket = ds_list_find_value(client_socket_list, i);
			if current_socket != socket {
				var slave = ds_map_find_value(socket_to_instance, current_socket);
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.player_joined);
				buffer_write(server_buffer, buffer_u8, current_socket);
				buffer_write(server_buffer, buffer_u16, slave.x);
				buffer_write(server_buffer, buffer_u16, slave.y);
				network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			}
			i+=1;
		}
		
		// tell other players we joined
		var i = 0;
		repeat(ds_list_size(client_socket_list)) {
			var current_socket = ds_list_find_value(client_socket_list, i);
			if current_socket != socket {
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.player_joined);
				buffer_write(server_buffer, buffer_u8, socket);
				buffer_write(server_buffer, buffer_u16, player.x);
				buffer_write(server_buffer, buffer_u16, player.y);
				network_send_packet(current_socket, server_buffer, buffer_tell(server_buffer));
			}
			i+=1;
		}
		
		break;
	// client disconnects
	case network_type_disconnect:
		var socket = ds_map_find_value(async_load, "socket");
		// stop keeping track of client socket
		ds_list_delete(
			client_socket_list, 
			ds_list_find_index(client_socket_list, socket)
		);
		
		var i = 0;
		repeat(ds_list_size(client_socket_list)) {
			var current_socket = ds_list_find_value(client_socket_list, i);
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_disconnect);
			buffer_write(server_buffer, buffer_u8, socket);
			network_send_packet(current_socket, server_buffer, buffer_tell(server_buffer));
			i+=1;	
		}
		
		with(ds_map_find_value(socket_to_instance, socket)) {
			instance_destroy();	
		}
		// delete socket object reference
		ds_map_delete(socket_to_instance, socket);
		break;
	case network_type_data:
		var buffer = ds_map_find_value(async_load, "buffer");
		var socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0); // idk someone said to
		process_packet(buffer, socket);
		break;
}