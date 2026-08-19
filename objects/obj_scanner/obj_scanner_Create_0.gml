/// Scanner Setup

// Variáveis do scanner
scanner_active = false;
scanner_range = 150;          
scanner_cooldown = 0;         
scanner_cooldown_max = 120;   
scan_duration = 180;           
scan_timer = 0;

// Problemas detectados
problems_detected = ds_list_create();
highlighted_problems = ds_list_create();

// Efeitos visuais
scan_pulse = 0;
scan_pulse_max = 30;

// Referência ao protagonista (CORRIGIDO: prota, não obj_prota)
player = instance_find(prota, 0);

if (player == noone) {
    show_debug_message("ERRO: prota não encontrado na sala!");
}

// Variável de confirmação
iGotThis = false;
