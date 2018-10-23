/// @description open/close torch
if global.type == "o_spartan"{
	if torch.image_index == 0 {
		torch.image_index = 1;
	} else if torch.image_index == 1 {
		torch.image_index = 0;	
	} else {
		torch.image_index = 0;	
	}
}
