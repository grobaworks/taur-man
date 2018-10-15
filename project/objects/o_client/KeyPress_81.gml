/// @description test UDP send

//encode mouse position and transmit
buffer_seek(send_buffer, buffer_seek_start,0);
//use first packet to send a 'code' for what is being sent. I picked 1 a message
buffer_write(send_buffer, buffer_u8, 1); 
buffer_write(send_buffer, buffer_string, "Hello World");
network_send_udp(socket, remote_ip, remote_port,send_buffer, buffer_tell(send_buffer));
