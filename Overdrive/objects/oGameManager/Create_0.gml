// --- Score Keeping ---
global.score = 0;
global.high_score = 0;

// --- Loop Mechanics ---
enemies_killed = 0;
kills_to_win = 20;     // Enemies needed to "complete" the level
level_loop = 1;        // Which loop are we on?

game_state = "PLAYING"; // "PLAYING" or "TRANSITION"
transition_timer = 0;