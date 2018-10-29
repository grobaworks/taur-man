/// @description initialize game

//init in get_input
global.type = "";
global.other = "";


global.url = "https://fierce-thicket-30230.herokuapp.com/instance";

//if instance_creator is true, this game instance will
//create the instance of the http server used for multiplayer
instance_creator = false;
global.http_id = ""; //init in http-start async
http_created = false;

h_start_x[0] = 100;
h_start_y[0] = 100;
h_start_x[1] = 269;
h_start_y[1] = 869;
h_start_x[2] = 969;
h_start_y[2] = 969;
var r = random_range(0, 2);
global.human = instance_create_depth(h_start_x[r], h_start_y[r], 0, o_spartan);

global.taur = instance_create_depth(500, 500, 0, o_minotaur);

global.camera = instance_create_depth(0,0,0,o_camera);

treasure = instance_create_depth(815, 125, 0, o_treasure);