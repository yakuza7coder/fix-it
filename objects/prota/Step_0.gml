if keyboard_check(vk_up)
{
   y-=1
}
if keyboard_check(vk_down)
{
	y+=1
}
if keyboard_check(vk_left)
{
	x-=1
}
if keyboard_check(vk_right)
{
	x+=1
}
if keyboard_check(vk_anykey)
{
	sprite_index=spr_andando
}
else
{
	sprite_index=s_player
}