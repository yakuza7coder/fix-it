if (!instance_exists(problema_alvo)) exit;

var _opcoes = problema_alvo.problem_data.opcoes;
var _nome = problema_alvo.problem_data.nome;
var _cam = view_camera[0];
var _vx = camera_get_view_x(_cam);
var _vy = camera_get_view_y(_cam);

var _px = _vx + 40;
var _py = _vy + 40;
var _altura = 30 + array_length(_opcoes) * 22;

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(_px, _py, _px + 420, _py + _altura, false);

draw_set_alpha(1);
draw_set_color(c_yellow);
draw_text(_px + 10, _py + 6, _nome);

for (var i = 0; i < array_length(_opcoes); i++) {
    var _cor = (i == opcao_selecionada) ? c_lime : c_white;
    draw_set_color(_cor);
    var _prefixo = (i == opcao_selecionada) ? "> " : "  ";
    draw_text(_px + 10, _py + 28 + i * 22, _prefixo + _opcoes[i].texto);
}

draw_set_color(c_gray);
draw_text(_px + 10, _py + _altura - 18, "[X] Cancelar");

draw_set_alpha(1);
draw_set_color(c_white);