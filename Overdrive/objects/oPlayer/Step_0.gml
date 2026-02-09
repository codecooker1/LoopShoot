// Get Inputs
var _key_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
var _key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
var _key_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
var _key_up = keyboard_check(ord("W")) or keyboard_check(vk_up);

// Calculate Direction
var _input_x = _key_right - _key_left;
var _input_y = _key_down - _key_up;

// Normalize Vector
var _input_magnitude = point_distance(0, 0, _input_x, _input_y);
var _input_direction = point_direction(0, 0, _input_x, _input_y);

can_shoot = max(0, can_shoot - 1);

if (mouse_check_button(mb_left) && can_shoot == 0) {
    
    can_shoot = fire_rate;

    var _inst = instance_create_layer(x, y, "Instances", oBullet);
    with (_inst) {
        direction = point_direction(other.x, other.y, mouse_x, mouse_y) + random_range(-3, 3);
        image_angle = direction;
		image_xscale = 0.2;
		image_yscale = 0.4;
    }

    var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
    h_spd -= lengthdir_x(recoil_force, _aim_dir);
    v_spd -= lengthdir_y(recoil_force, _aim_dir);
	
	screen_shake(2);
}

// Clamp magnitude 
_input_magnitude = clamp(_input_magnitude, 0, 1);

// Calculate Target Velocity
var _target_h_spd = lengthdir_x(move_speed * _input_magnitude, _input_direction);
var _target_v_spd = lengthdir_y(move_speed * _input_magnitude, _input_direction);

// Apply Acceleration and Friction (The "Juice")
var _smoothness = (_input_magnitude > 0) ? acceleration : friction_val;

h_spd = lerp(h_spd, _target_h_spd, _smoothness);
v_spd = lerp(v_spd, _target_v_spd, _smoothness);

// Horizontal Collision
if (place_meeting(x + h_spd, y, oSolid)) {
    // Move as close as possible to the wall before stopping
    while (!place_meeting(x + sign(h_spd), y, oSolid)) {
        x += sign(h_spd);
    }
    h_spd = 0;
}
x += h_spd;

// Vertical Collision
if (place_meeting(x, y + v_spd, oSolid)) {
    // Move as close as possible to the wall before stopping
    while (!place_meeting(x, y + sign(v_spd), oSolid)) {
        y += sign(v_spd);
    }
    v_spd = 0;
}
y += v_spd;

