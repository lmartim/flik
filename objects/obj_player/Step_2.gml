/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x + velh, y, obj_collision)) {
	while(!place_meeting(x + sign(velh), y, obj_collision)) {
		x += sign(velh);	
	}
	velh = 0;
}

if (place_meeting(x, y + velv, obj_collision)) {
	show_debug_message("AH");
	while(!place_meeting(x, y + sign(velv), obj_collision)) {
		y += sign(velv);	
	}
	velv = 0;
}

x += velh;
y += velv;