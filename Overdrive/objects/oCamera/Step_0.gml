if (instance_exists(target)) {
    // 1. Calculate Target Position
    // We want the midpoint between the Player and the Mouse
    var _x_to = target.x + (mouse_x - target.x) * peek_amount;
    var _y_to = target.y + (mouse_y - target.y) * peek_amount;

    // 2. Smoothly Move Camera (Lerp)
    // We update our own x/y to move 10% (0.1) of the way to the target every frame
    x = lerp(x, _x_to, smoothness);
    y = lerp(y, _y_to, smoothness);
}

// 3. Clamp to Room Bounds (Don't show black void outside room)
x = clamp(x, cam_w/2, room_width - cam_w/2);
y = clamp(y, cam_h/2, room_height - cam_h/2);

// 4. Update GameMaker's Camera View
camera_set_view_pos(view_camera[0], x - cam_w/2, y - cam_h/2);