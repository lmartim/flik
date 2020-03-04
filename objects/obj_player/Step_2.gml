/// @description Insert description here
// You can write your code in this editor
repeat(abs(velh)) {
	
	if (place_meeting(x + sign(velh), y, obj_collision) && !place_meeting(x + sign(velh), y - 1 , obj_collision)) {
		y--;
	}
	
	if (!place_meeting(x + sign(velh), y, obj_collision) && !place_meeting(x + sign(velh), y + 1 , obj_collision) && !place_meeting(x + sign(velh), y + 2 , obj_collision)) {
		y++;
	}
	
	if (!place_meeting(x + sign(velh), y, obj_collision)) {
		x += sign(velh);
	} else {
		velh = 0;
		break;
	}
}

repeat(abs(velv)) {
	if (!place_meeting(x, y + sign(velv), obj_collision)) {
		y += sign(velv);
	} else {
		velv = 0;
		break;
	}
}