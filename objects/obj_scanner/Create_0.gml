
scanner_active = false;
scanner_range = 150;
scanner_cooldown = 0;
scanner_cooldown_max = 120;
scan_duration = 180;
scan_timer = 0;
problems_detected = ds_list_create();
highlighted_problems = ds_list_create();
scan_pulse = 0;
scan_pulse_max = 30;
player = instance_find(obj_prota, 0);

if (player == noone) {
    show_debug_message("ERRO: obj_prota não encontrado na sala!");
}
