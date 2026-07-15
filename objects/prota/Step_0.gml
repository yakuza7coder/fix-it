hspeed = 0;
vspeed = 0


hsp = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd
vsp = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd




	if keyboard_check(ord("W")) vsp = -spd;
if keyboard_check(ord("S")) vsp = spd;
if keyboard_check(ord("A")) hsp = -spd;
if keyboard_check(ord("D")) hsp = spd;

x += hsp
y += vsp

if (keyboard_check(ord(("A")))|| keyboard_check(ord("S")) || keyboard_check(ord("D")) || keyboard_check(ord("W"))){
	sprite_index = spr_andando
} else {
	sprite_index = s_player
}