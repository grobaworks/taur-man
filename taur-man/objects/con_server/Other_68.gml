var type_event = ds_map_find_value(async_load,"type");

// what happened? 
switch(type_event) {
	// client connected
	case network_type_connect:	
		// keep track of what client sockets are connected
		var socket = ds_map_find_value(async_load, "socket");
		ds_list_add(server_socket_list, socket);
		if (global.server != undefined) {
			player = instance_create_depth(400, 400, 1, obj_monster);
		} else {
			player = instance_create_depth(500, 500, 1, obj_player);
		}
		ds_map_add(server_socket_to_instance, socket, player);
		
		// tell the client it connected, send starting values
		buffer_seek(server_buffer, buffer_seek_start, 0);
		buffer_write(server_buffer, buffer_u8, network.player_connect);
		buffer_write(server_buffer, buffer_u8, socket);
		buffer_write(server_buffer, buffer_u16, player.x);
		buffer_write(server_buffer, buffer_u16, player.y);
		network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
		
		// tell the connecting client what players exist
		var i = 0;
		repeat(ds_list_size(server_socket_list)) {
			var current_socket = ds_list_find_value(server_socket_list, i);
			if current_socket != socket {
				var current_player = ds_map_find_value(server_socket_to_instance, current_socket);
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.player_joined);
				buffer_write(server_buffer, buffer_u8, current_socket);
				buffer_write(server_buffer, buffer_u16, current_player.x);
				buffer_write(server_buffer, buffer_u16, current_player.y);
				network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			}
			i+=1;
		}
		
		// tell other players they joined
		var i = 0;
		repeat(ds_list_size(server_socket_list)) {
			var current_socket = ds_list_find_value(server_socket_list, i);
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
		
		if (ds_list_size(server_socket_list) == max_clients) {
			instance_create_depth(0, 0, 0, obj_ready_up_flag);
		}
		
		break;
	// client disconnects
	case network_type_disconnect:
		var socket = ds_map_find_value(async_load, "socket");
		// stop keeping track of client socket
		ds_list_delete(
			server_socket_list, 
			ds_list_find_index(server_socket_list, socket)
		);
		
		// tell each other client they disconnected
		var i = 0;
		repeat(ds_list_size(server_socket_list)) {
			var current_socket = ds_list_find_value(server_socket_list, i);
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_disconnect);
			buffer_write(server_buffer, buffer_u8, socket);
			network_send_packet(current_socket, server_buffer, buffer_tell(server_buffer));
			i+=1;	
		}
		
		// delete client player object
		with(ds_map_find_value(server_socket_to_instance, socket)) {
			instance_destroy();	
		}
		// delete socket object reference
		ds_map_delete(server_socket_to_instance, socket);
		break;
	case network_type_data:
		var buffer = ds_map_find_value(async_load, "buffer");
		var socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0); // idk someone said to
		process_client_packet(buffer, socket);
		break;
}