enum network {
	move,
	player_connect,
	player_joined,
	player_disconnect
}


var port = 6510;
var max_clients = 6;

network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);
client_socket_list = ds_list_create();
socket_to_instance = ds_map_create();

player_spawn_x = 100;
player_spawn_y = 100;