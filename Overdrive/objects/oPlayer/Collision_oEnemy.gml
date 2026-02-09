hp -= 1;

screen_shake(12);

if (global.score > global.high_score) {
    global.high_score = global.score;
    
    try {
        ini_open("save_data.ini");
        ini_write_real("Scores", "HighScore", global.high_score);
        ini_close();
    } catch (_error) {
        show_debug_message("Save Failed: User might be in Incognito Mode.");
    }
}

if (hp <= 0) {
    if (instance_exists(oGameManager)) {
        oGameManager.state = "GAME_OVER";
    }
    
    repeat(10) {
        instance_create_layer(x, y, "Instances", oBullet);
    }
    
    instance_destroy();
}