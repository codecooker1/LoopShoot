if (instance_exists(target)) {
    var _x_to = target.x + (mouse_x - target.x) * peek_amount;
    var _y_to = target.y + (mouse_y - target.y) * peek_amount;

    x = lerp(x, _x_to, smoothness);
    y = lerp(y, _y_to, smoothness);
}

x = clamp(x, cam_w/2, room_width - cam_w/2);
y = clamp(y, cam_h/2, room_height - cam_h/2);

camera_set_view_pos(view_camera[0], x - cam_w/2, y - cam_h/2);

// Apply Shake
x += random_range(-shake_magnitude, shake_magnitude);
y += random_range(-shake_magnitude, shake_magnitude);

shake_magnitude = lerp(shake_magnitude, 0, 0.1);