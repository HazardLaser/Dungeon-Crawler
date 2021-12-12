alarm[1] = room_speed*1;
sprite_index = spr_darkWizardPostCast;
audio_play_sound(snd_wizardCast, 10, false);
instance_create_layer(x, y+4, "enemyProjectiles", obj_wizardBall);