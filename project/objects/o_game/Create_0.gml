/// @description initialize game

//init in get_input
global.type = "";
global.other = "";

global.url = "https://fierce-thicket-30230.herokuapp.com/instance";

human = instance_create_depth(500, 500, 0, o_player);
human.type = "human";

taur = instance_create_depth(100, 100, 0, o_player);
taur.type = "taur";