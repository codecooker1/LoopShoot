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
kills_current = 0;
kills_needed = 20;

// State Machine
state = "PLAYING";         // "PLAYING", "LEVEL_COMPLETE", "GAME_OVER"
timer = 0;