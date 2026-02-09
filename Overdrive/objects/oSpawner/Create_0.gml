timer = 0;
spawn_rate = 60;
alarm[0] = 1;

repeat(64){
	instance_create_layer(random(room_width), random(room_height), "Instances", oDust);
}