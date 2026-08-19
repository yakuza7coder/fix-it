if (text == "") exit;

draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(5, 5, 310, 40, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text(10, 10, text);
draw_set_color(c_white);