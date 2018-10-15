/// @description check for buffer data

//check for data
var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);
read_packet(buffer); //explained below
