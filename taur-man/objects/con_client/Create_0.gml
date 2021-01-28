client_socket = network_create_socket(network_socket_tcp);
network_connect(client_socket, "127.0.0.1", 6510);

client_buffer = buffer_create(1024, buffer_fixed, 1);
client_socket_to_instance = ds_map_create();