// Only spawn if we are playing (not in transition)
if (oGameManager.game_state == "PLAYING") {
    
    // 1. PSEUDO-PERLIN GENERATION
    // We iterate through a few points to find a "Hotspot"
    // 'current_time' creates the moving wave effect
    var _noise_val = 0;
    var _check_x = 0;
    var _check_y = 0;
    
    // Try 5 times to find a valid "Noise High Point"
    repeat(5) {
        _check_x = random(room_width);
        _check_y = random(room_height);
        
        // Create a wave value based on location and time
        // This math mimics Perlin 'clumping'
        var _val = sin(_check_x * 0.01 + current_time * 0.002) + cos(_check_y * 0.01 + current_time * 0.001);
        
        // If the value is high enough, we found a "cluster spot"
        if (_val > 0.5) {
            
            // 2. Spawn Logic (Ensure not on player)
            if (point_distance(_check_x, _check_y, oPlayer.x, oPlayer.y) > 300) {
                instance_create_layer(_check_x, _check_y, "Instances", oEnemy);
                break; // Stop looking, we found a spot
            }
        }
    }
}

// Reset Alarm with a bit of randomness
alarm[0] = spawn_rate + random_range(-10, 10);