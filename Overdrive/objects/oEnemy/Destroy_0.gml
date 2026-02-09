// Add Score
global.score += 100;

screen_shake(10);

// Notify Game Controller
if (instance_exists(oGameManager)) {
    oGameManager.kills_current++;
}