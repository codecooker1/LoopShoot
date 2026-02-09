hp -= 2;

knockback_speed = 6; 
image_blend = c_red; 
alarm[0] = 3;    

if(hp <= 0){
	instance_destroy();
}

