enum network {
	player_connect,
	player_joined,
	player_disconnect,
	move
}


var port = 6510;
max_clients = 2;

network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);
server_socket_list = ds_list_create();
server_socket_to_instance = ds_map_create();