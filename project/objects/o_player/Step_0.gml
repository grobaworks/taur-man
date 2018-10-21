/// @description things to do per step
if global.type = name {
	var change = move(move_speed);
	if change {
		post_movement(x, y);
	}
} else { 
	counter += 1;
	//update player movement from server
	if counter == request_speed {
		//assignment code found in async-http
		get_movement();
		counter = 0;
	}
}
