if (state == "PLAYING" && kills_current >= kills_needed) {
    state = "LEVEL_COMPLETE";
    timer = 180; 
}

if (state == "LEVEL_COMPLETE") {
    timer--;
    
    if (timer <= 0) {
        // Increase Difficulty
        global.loop_count++;
        global.difficulty += 0.2;
        kills_needed = round(kills_needed * 1.5);
        kills_current = 0;

        state = "PLAYING";
        room_restart();
    }
}

if (state == "GAME_OVER") {
    if (keyboard_check_pressed(vk_space)) {
		state = "PLAYING";
		global.score = 0;
        room_restart();
    }
}