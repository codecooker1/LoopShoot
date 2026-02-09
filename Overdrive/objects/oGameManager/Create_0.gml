randomize();
persistent = true;

// Global Game State
global.score = 0;
global.high_score = 0;
global.loop_count = 1;
global.difficulty = 1.0;

ini_open("save_data.ini");
global.high_score = ini_read_real("Scores", "HighScore", 0);
ini_close();

// Level Progress
kills_def = 0;
kills_needed_def = 20;
kills_current = kills_def;
kills_needed = kills_needed_def;

// State Machine
state = "PLAYING";         // "PLAYING", "LEVEL_COMPLETE", "GAME_OVER"
timer = 0;