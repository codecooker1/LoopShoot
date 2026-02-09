// Draw Score
draw_set_color(c_white);
draw_text(20, 20, "Score: " + string(global.score));
draw_text(20, 40, "High Score: " + string(global.high_score));
draw_text(20, 60, "Loop: " + string(level_loop));
draw_text(20, 80, "Progress: " + string(enemies_killed) + "/" + string(kills_to_win));
draw_text(20, 100, "Level: 0");

// Draw "Fake Win" Message
if (game_state == "TRANSITION") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    draw_text_transformed(_cx, _cy, "LEVEL COMPLETE!", 2, 2, 0);
    draw_text(_cx, _cy + 50, "Initializing Next Level...");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}