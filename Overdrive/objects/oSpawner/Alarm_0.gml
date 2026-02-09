if (oGameManager.state == "PLAYING") {
   
    var _noise_val = 0;
    var _check_x = 0;
    var _check_y = 0;
    
    repeat(5) {
        _check_x = random(room_width);
        _check_y = random(room_height);
        
        var _val = sin(_check_x * 0.01 + current_time * 0.002) + cos(_check_y * 0.01 + current_time * 0.001);
        
        if (_val > 0.5) {
            
            if (point_distance(_check_x, _check_y, oPlayer.x, oPlayer.y) > 300) {
                instance_create_layer(_check_x, _check_y, "Instances", oEnemy);
                break;
            }
        }
    }
}

alarm[0] = spawn_rate + random_range(-10, 10);