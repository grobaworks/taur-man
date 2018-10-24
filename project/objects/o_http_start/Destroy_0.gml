/// @description delete http server instance
var url = "https://fierce-thicket-30230.herokuapp.com/delete/?id=" + string(global.http_id);

http_post_string(url, "");