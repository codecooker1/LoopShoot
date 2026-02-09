draw_set_font(-1);
draw_set_color(c_white);

if (state == "PLAYING") {
	draw_text(20, 20, "HIGH SCORE: " + string(global.high_score));
    draw_text(20, 40, "SCORE: " + string(global.score));
    draw_text(20, 60, "LOOP: " + string(global.loop_count));
    draw_text(20, 80, "ESCAPING: " + string(kills_current) + "/" + string(kills_needed));
    
    // Draw Health
    if (instance_exists(oPlayer)) {
        draw_text(20, 100, "HP: " + string(oPlayer.hp));
    }
}
else if (state == "LEVEL_COMPLETE") {
    // The "Fake Win" Screen
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    draw_set_color(c_lime);
    draw_text_transformed(_cx, _cy, "SYSTEM STABILIZED...", 2, 2, 0);
    draw_text(_cx, _cy + 50, "INITIALIZING ESCAPE SEQUENCE...");
    
    // Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
else if (state == "GAME_OVER") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    draw_set_color(c_red);
    draw_text_transformed(_cx, _cy, "CONNECTION LOST", 3, 3, 0);
    draw_text(_cx, _cy + 60, "Final Score: " + string(global.score));
    draw_text(_cx, _cy + 90, "Press SPACE to Reboot");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}