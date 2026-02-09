function screen_shake(_amount) {
    if (instance_exists(oCamera)) {
        oCamera.shake_magnitude = _amount;
    }
}
