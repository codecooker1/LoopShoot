if (instance_exists(oPlayer)) {
    
    var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    
    if (knockback_speed > 0) {
        x -= lengthdir_x(knockback_speed, _dir);
        y -= lengthdir_y(knockback_speed, _dir);
        
        knockback_speed = lerp(knockback_speed, 0, 0.1);
        if (knockback_speed < 0.1) knockback_speed = 0;
    } else {
        mp_potential_step(oPlayer.x, oPlayer.y, spd, false);
        
        image_angle = _dir;
    }
}

if (hp <= 0) {
    instance_destroy();
}