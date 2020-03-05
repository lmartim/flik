/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
	if ((obj_player.y-5) > y) {
		sprite_index = -1;
		show_debug_message("PLAY ABAIXO");
	} else {
		sprite_index = spr_collision_float;
		show_debug_message("PLAY ACIMA");
	}
}