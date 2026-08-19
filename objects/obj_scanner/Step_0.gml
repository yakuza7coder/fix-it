
if (player == noone) exit;

if (keyboard_check_pressed(ord("R")) && scanner_cooldown <= 0) {
    scanner_active = true;
    scan_timer = scan_duration;
    scanner_cooldown = scanner_cooldown_max;

    if (instance_exists(obj_men)) {
        obj_men.text = "Varrendo área...";
        obj_men.tempo = scan_duration;
    }
}

if (scanner_cooldown > 0) {
    scanner_cooldown--;
}

if (scanner_active) {
    scan_timer--;
    if (scan_timer <= 0) {
        scanner_active = false;
    }
}


if (scanner_active) {
    scan_pulse += 1;
    if (scan_pulse > scan_pulse_max) {
        scan_pulse = 0;
    }
}

ds_list_clear(problems_detected);

with (obj_problema) {
    var _dist = distance_to_object(other.player);
    if (_dist <= other.scanner_range) {
        ds_list_add(other.problems_detected, id);
    }
}

if (scanner_active) {
    ds_list_clear(highlighted_problems);
    var _size = ds_list_size(problems_detected);
    for (var i = 0; i < _size; i++) {
        var _prob = problems_detected[| i];
        ds_list_add(highlighted_problems, _prob);
        if (instance_exists(_prob)) {
            _prob.is_highlighted = true;
        }
    }
} else {
    var _size = ds_list_size(highlighted_problems);
    for (var i = 0; i < _size; i++) {
        var _prob = highlighted_problems[| i];
        if (instance_exists(_prob)) {
            _prob.is_highlighted = false;
        }
    }
    ds_list_clear(highlighted_problems);
}

player.iGotThis = (ds_list_size(problems_detected) > 0);
