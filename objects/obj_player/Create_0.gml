/// @description Insert description here
// You can write your code in this editor

//---------------FORÇAS
grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;

//--------------VELOCIDADES
velh = 0;
velv = 0;
max_velh = 6;
max_velv = 8;
max_velv_escada = 2;

//--------------PULO
limite_pulo = 6;
timer_pulo = limite_pulo;

//--------------ESCADA
isStairs = false;
isStairsDown = false;

//--------------CONTROLE
chao = false;

enum state {
	parado,
	movendo,
	escalando,
	pulando
}
estado = state.parado

spr_idle = spr_player_idle;
spr_jump = spr_player_jump;
spr_fall = spr_player_fall;
spr_climb = spr_player_climb;
spr_esq = spr_player_esq;
