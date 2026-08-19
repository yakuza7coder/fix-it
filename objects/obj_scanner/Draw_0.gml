
if (!scanner_active) exit;
if (player == noone) exit;

var _pulse_scale = 0.8 + (scan_pulse / scan_pulse_max) * 0.2;

draw_set_alpha(0.3);
draw_set_color(c_lime);
draw_circle(player.x, player.y, scanner_range * _pulse_scale, false);

draw_set_alpha(0.6);
draw_set_color(c_lime);
draw_circle(player.x, player.y, scanner_range * _pulse_scale, true);

var _size = ds_list_size(highlighted_problems);
for (var i = 0; i < _size; i++) {
    var _prob = highlighted_problems[| i];
    if (instance_exists(_prob)) {
        var _w = _prob.sprite_width;
        var _h = _prob.sprite_height;

        draw_set_alpha(0.4 + sin(current_time / 100) * 0.2);
        draw_set_color(c_red);
        draw_rectangle(_prob.x - _w/2, _prob.y - _h/2, _prob.x + _w/2, _prob.y + _h/2, false);

        draw_set_alpha(0.9);
        draw_rectangle(_prob.x - _w/2, _prob.y - _h/2, _prob.x + _w/2, _prob.y + _h/2, true);

       
        var _label = "!";
        if (variable_instance_exists(_prob, "problem_data")) {
            _label = _prob.problem_data.nome;
        }

        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text(_prob.x, _prob.y - _h/2 - 20, _label);
    }
}

draw_set_alpha(1);
draw_set_color(c_white);
