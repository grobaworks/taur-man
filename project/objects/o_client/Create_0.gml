/// @description initialize client object

var type = network_socket_udp;
socket = network_create_socket(type);
//Server IP and port, needed to send packets
remote_ip = "10.21.1.247";
remote_port = 8000;
//Make a buffer to hold packet data
var size = 1024;
var type = buffer_fixed;
var alignment = 1;
send_buffer = buffer_create(size, type, alignment);

show_debug_message("Client created");
