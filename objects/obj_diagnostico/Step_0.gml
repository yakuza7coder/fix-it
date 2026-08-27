if (!instance_exists(problema_alvo)) {
    instance_destroy();
    exit;
}

var _opcoes = problema_alvo.problem_data.opcoes;
var _total = array_length(_opcoes);

if (keyboard_check_pressed(vk_down)) {
    opcao_selecionada = (opcao_selecionada + 1) mod _total;
}
if (keyboard_check_pressed(vk_up)) {
    opcao_selecionada = (opcao_selecionada - 1 + _total) mod _total;
}
if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape)) {
    instance_destroy();
    exit;
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
    resolve_problem(problema_alvo, opcao_selecionada);
    instance_destroy();
}