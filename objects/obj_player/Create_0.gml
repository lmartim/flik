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

//--------------PULO
limite_pulo = 6;
timer_pulo = limite_pulo;

//--------------ESCADA
isStairs = false;
isStairsDown = false;

//--------------NPC
npc = noone;

//--------------CONTROLE
chao = false;

enum state {
	parado,
	movendo,
	escalando,
	pulando,
	interagindo
}
estado = state.parado

spr_idle = spr_player_idle;
spr_jump = spr_player_jump;
spr_fall = spr_player_fall;
spr_climb = spr_player_climb;
spr_esq = spr_player_esq;



//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_player_portrait;
myVoice				= snd_voice2;
myFont				= fnt_dialogue;
myName				= "Flik";
