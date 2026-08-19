/// Scanner Main Logic

// Input para ativar scanner (E)
if (keyboard_check_pressed(ord("E")) && scanner_cooldown <= 0) {
    scanner_active = true;
    scan_timer = scan_duration;
    scanner_cooldown = scanner_cooldown_max;
    
    // Mensagem ao ativar
    if (instance_exists(obj_men)) {
        obj_men.text = "Varrendo área...";
        obj_men.tempo = 60;
    }
}

// Decrementar cooldown
if (scanner_cooldown > 0) {
    scanner_cooldown--;
}

// Gerenciar duração da varredura
if (scanner_active) {
    scan_timer--;
    if (scan_timer <= 0) {
        scanner_active = false;
    }
}

// Atualizar pulse visual (animação)
if (scanner_active) {
    scan_pulse += 1;
    if (scan_pulse > scan_pulse_max) {
        scan_pulse = 0;
    }
}

// ======================================
// DETECÇÃO DE PROBLEMAS
// ======================================
ds_list_clear(problems_detected);

// Procurar por objetos "problema" dentro do raio
with (obj_problema) {
    var dist = distance_to_object(other.player);
    
    // Se dentro do raio de detecção
    if (dist <= other.scanner_range) {
        ds_list_add(other.problems_detected, id);
    }
}

// ======================================
// ATUALIZAR HIGHLIGHT
// ======================================
ds_list_clear(highlighted_problems);

if (scanner_active) {
    // Copiar todos os problemas detectados para highlight
    var size = ds_list_size(problems_detected);
    for (var i = 0; i < size; i++) {
        var prob_id = problems_detected[| i];
        ds_list_add(highlighted_problems, prob_id);
        
        // Marcar o problema como "visto"
        if (instance_exists(prob_id)) {
            prob_id.is_highlighted = true;
        }
    }
}

// Remover highlight de problemas que saíram do raio
var size = ds_list_size(highlighted_problems);
for (var i = 0; i < size; i++) {
    var prob_id = highlighted_problems[| i];
    if (!instance_exists(prob_id)) {
        ds_list_delete(highlighted_problems, i);
        size--;
        i--;
    } else if (!scanner_active) {
        prob_id.is_highlighted = false;
    }
}

// Flag para o protagonist (para UI)
if (ds_list_size(problems_detected) > 0 && player != noone) {
    player.iGotThis = true;
} else if (player != noone) {
    player.iGotThis = false;
}
