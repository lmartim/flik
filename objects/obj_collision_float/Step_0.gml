/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
	if (((obj_player.y-5) > y) || obj_player.estado == state.escalando) {
		sprite_index = -1;
	} else {
		sprite_index = spr_collision_float;
	}
}