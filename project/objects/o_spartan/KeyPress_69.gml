/// @description open/close torch
if global.type == "o_spartan"{
	if torch.image_index == 0 {
		torch.image_index = 1;
	} else torch.image_index = 0;
}
