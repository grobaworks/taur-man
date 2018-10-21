/// @description initialize game

//init in get_input
global.type = "";
global.other = "";

global.url = "https://fierce-thicket-30230.herokuapp.com/instance";

global.human = instance_create_depth(500, 500, 0, o_player);
global.human.type = "human";

global.taur = instance_create_depth(100, 100, 0, o_player);
global.taur.type = "taur";

global.camera = instance_create_depth(0,0,0,o_camera);

