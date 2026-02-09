cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

target = oPlayer; // Who we follow
peek_amount = 0.3;   // How much we look towards mouse (0 to 1)
smoothness = 0.1;    // Lower = smoother/slower, Higher = snappier