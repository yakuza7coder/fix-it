
var mouse_sobre = position_meeting(mouse_x, mouse_y, id);

if (mouse_sobre) {
    image_alpha = 0.8;
    image_xscale = 1.1;
    image_yscale = 1.1;
 
    if (mouse_check_button_pressed(mb_left)) {
       //bglh que destroi o obj mas dá pra substituir por outra coisa
        instance_destroy(); 
    }
} else {

    image_alpha = 1.0;
    image_xscale = 1.0;
    image_yscale = 1.0;
}