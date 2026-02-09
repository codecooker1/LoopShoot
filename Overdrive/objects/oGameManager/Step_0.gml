if (game_state == "TRANSITION") {
    transition_timer--;
    
    if (transition_timer <= 0) {
        // --- THE LOOP LOGIC ---
        // Increase difficulty slightly
        kills_to_win += 5; 
        level_loop++;
        
        // Save High Score
        if (global.score > global.high_score) {
            global.high_score = global.score;
        }

        // Restart the room (The "Loop")
        enemies_killed = 0;
        game_state = "PLAYING";
        room_restart();
    }
}