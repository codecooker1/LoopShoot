// Base Stats
hp_max = 3;
base_spd = 2.0;

var _diff = 1;

if (variable_global_exists("difficulty")) {
    _diff = global.difficulty;
} else {
    _diff = 1.0;
}

hp = hp_max * _diff;
spd = base_spd + (_diff * 0.5); 

knockback_speed = 0;