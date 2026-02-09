
hp -= 2;

knockback_speed = 6; 
image_blend = c_red; 
alarm[0] = 3;    

// Add Score
global.score += 100;

// Notify Game Controller
if (instance_exists(oGameManager)) {
    oGameManager.enemies_killed++;
    
    // Check for "Level Complete"
    if (oGameManager.enemies_killed >= oGameManager.kills_to_win) {
        if (oGameManager.game_state == "PLAYING") {
            oGameManager.game_state = "TRANSITION";
            oGameManager.transition_timer = 120; // Wait 2 seconds (120 frames)
        }
    }
}

instance_destroy();

instance_destroy(other);
