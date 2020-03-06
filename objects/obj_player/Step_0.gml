/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

//Checando colisão com o chão
chao = place_meeting(x, y + 1, obj_collision);

//Configurando timer do pulo
if (chao) {
	timer_pulo = limite_pulo;	
} else {
	if (timer_pulo > 0) timer_pulo--;	
}

//-----------CONTROLES
var up, down, left, right, jump, avanco_h, avanco_v;

up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
jump = keyboard_check_pressed(vk_space);

//CONFIG MOVIMENTAÇÃO
avanco_h = (right - left) * max_velh;
avanco_v = (down - up) * max_velv;

if (chao) acel = acel_chao;
else acel = acel_ar;

//STATE MACHINE
switch(estado) {
	case state.parado:
		
		velh = 0;
		velv = 0;
		
		image_speed = 1;
		sprite_index = spr_idle;
		
		//Pulando
		if (jump && chao) velv = -max_velv;	
		
		//Gravidade
		if (!chao) velv += grav;
		
		//State change
		if (abs(velh) > 0 || abs(velv) > 0 || left || right || jump) {
			estado = state.movendo;	
		}
		
	
		break;
	case state.movendo:
		
		//Aplicando movimentação
		velh = lerp(velh, avanco_h, acel);
		
		//Gravidade
		if (!chao) velv += grav;
		
		//Pulando
		if (jump && (chao || timer_pulo > 0)) {
			velv = -max_velv;	
			sprite_index = spr_jump;
		}
		
		break;
	case state.escalando:
		velh = 0;
		velv = lerp(velv, avanco_v, acel);
		
		if (!isStairs || (down && place_meeting(x, y + 1, obj_collision))) {
			estado = state.movendo;
			velv = 0;
		}
		
		break;
}

//LIMITANDO VELOCIDADE
velv = clamp(velv, -max_velv, max_velv);

//SUBINDO E DESCENDO ESCADAS
if (isStairs && estado != state.escalando && up && !isStairsDown) {
	x = isStairs.x+20;
	y = isStairs.y+15;
	estado = state.escalando;	
}
if (isStairsDown && estado != state.escalando && down) {
	x = isStairs.x+20;
	y = isStairs.y+15;
	estado = state.escalando;	
}

