if triggered exit;

triggered = true;
audio_play_sound(sfx_powerup, 1, 0, 0.5, 0, 2.0);

image_index = irandom_range(1, image_number-1);