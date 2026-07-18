hspeed = 0;
vspeed = 0


hsp = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd
vsp = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd




	if keyboard_check(ord("W")) vsp = -spd;
if keyboard_check(ord("S")) vsp = spd;
if keyboard_check(ord("A")) hsp = -spd;
if keyboard_check(ord("D")) hsp = spd;

if(hsp != 0){
	image_xscale = sign(hsp) * 2
}	


if (keyboard_check(ord(("A")))|| keyboard_check(ord("S")) || keyboard_check(ord("D")) || keyboard_check(ord("W"))){
	sprite_index = spr_andando
} else {
	sprite_index = s_player
}

//trem de colisao
if(place_meeting(x + hsp, y, obj_colision)){
    while (!place_meeting(x + sign(hsp), y, obj_colision)) {
        x += sign(hsp)
    }
    hsp = 0;
}
x += hsp;

if(place_meeting(x, y + vsp, obj_colision)){
    while (!place_meeting(x, y + sign(vsp), obj_colision)) {
        y += sign(vsp)
    }
    vsp = 0
}
y += vsp;
