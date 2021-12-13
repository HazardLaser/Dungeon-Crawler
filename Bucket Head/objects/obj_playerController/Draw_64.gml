//GUI FOR HEALTH
draw_sprite(spr_GUIBackground, 0, 0, 696);
draw_sprite(spr_bucketHealth, 0 ,38, 732);
draw_set_color(c_white)
draw_set_font(fnt_CodersCruxBig);
draw_set_valign(fa_middle);
draw_text(77, 740, "X " + string(global.playerHealth));

//GUI FOR MONEY
draw_sprite(spr_GUIBackground, 0, 0, 0);
draw_sprite(spr_bigGold, 0 ,38, 36);
draw_set_color(c_white)
draw_set_font(fnt_CodersCruxBig);
draw_set_valign(fa_middle);
draw_text(88, 50, "X " + string(global.money));

//GUI FOR TIME
draw_sprite(spr_GUIBackground, 0, 896, 0);
draw_set_color(c_white)
draw_set_font(fnt_CodersCruxBig);
draw_set_valign(fa_middle);
if(global.second < 10){
	draw_text(906, 50, "Time: " + string(global.minute) + ":0" + string(global.second));
}
else{
	draw_text(906, 50, "Time: " + string(global.minute) + ":" + string(global.second));
}