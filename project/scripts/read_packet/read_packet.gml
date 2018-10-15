/// @description read data from a packet
/// @function read_packet(buffer);
/// @param buffer the buffer to read
var buffer = argument0;
var msg_id = buffer_read(buffer,buffer_u8);
var msg = buffer_read(buffer, buffer_string);
//do something with that mouse position
show_debug_message(msg);