if (instance_exists(obj_diagnostico)) exit;
var hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(hor * move_spd, ver * move_spd, tilemap, undefined, undefined, undefined);

if (hor !=0 or ver != 0)
{
    if (ver > 0) sprite_index = spr_prota_fren;
        else if (ver < 0) sprite_index = spr_prota_tras;
            else if (hor > 0) sprite_index = spr_prota_dir;
				 else if (hor < 0) sprite_index = spr_prota_esq;
}
else
{
if (sprite_index == spr_prota_dir) sprite_index = spr_prota_dir_idle;
else if (sprite_index == spr_prota_esq) sprite_index = spr_prota_esq_idle;
else if (sprite_index == spr_prota_fren) sprite_index = spr_prota_par;
else if (sprite_index == spr_prota_tras) sprite_index = spr_prota_tras_idle;
}