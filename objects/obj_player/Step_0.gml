/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor


var up, down, left, right, vel_h, vel_v, desli;

up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
//interac = keyboard_check_pressed(ord("E"));

if (up) { 

	if (estado != "pulando") {
		face = 1; 
		faceInt = -5; 
		gravy -= 5;
		estado = "pulando";
		upPressed = true;
	}
	if (upPressed) {
		gravy -= 5;
		show_debug_message(gravy);
		if (gravy <= -30){
			gravy = 1;
			upPressed = false;
		}
	}
} else {
	face = 3; 
	faceInt = 5;
	upPressed = false;
	
	if (estado == "pulando") {
		gravy = 1;
	} else {
		gravy = 0;	
	}
}
if (down) { face = 3; faceInt = 5; }
if (left) { face = 2; faceInt = -5; }
if (right) { face = 0; faceInt = 5; }

vel_h = (right - left) * vel;
vel_v = gravy * vel;

desli = des_n;	

if (velh != 0) {
	image_xscale = sign(velh) * 1;
}

switch(estado) {
	case "parado":
		velh = 0;
		velv = 0;
		
		sprite_index = idle;

		if (vel_v != 0 || vel_h != 0) estado = "movendo";
		
		break;
	case "movendo":
		velh = lerp(velh, vel_h, desli);
		velv = lerp(velv, vel_v, desli);
		if (face == 0 || face == 2) {
			sprite_index = esq;	
		}
		
		if (abs(velv) < .5 && abs(velh) < .5) estado = "parado";
		
		break;
	case "pulando":
		velh = lerp(velh, vel_h, desli);
		velv = lerp(velv, vel_v, desli);
		if (velv <= maxVelv) {
			velv = maxVelv;
		}

		break;
}

if (place_meeting(x + velh, y, obj_collision)) {
	while (!place_meeting(x + sign(velh), y, obj_collision)) {
		x += sign(velh);
	}
	velh = 0;
}
if (place_meeting(x, y + velv, obj_collision)) {
	while (!place_meeting(x, y + sign(velv), obj_collision)) {
		y += sign(velv);	
	}
	velv = 0;
	if (estado == "pulando") estado = "movendo";
}

x += velh;
y += velv;
