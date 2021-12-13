draw_self();
draw_set_valign(fa_top);
draw_set_font(fnt_CodersCruxBig);
draw_set_color(c_white);
if(global.win){
	draw_text(24,24,"YOU WIN!");
}
else{
	draw_text(24,24,"GAME OVER!");
}
draw_set_font(fnt_CodersCrux);
draw_text(24,64, "Coins: " + string(global.money) + "\nEnemies: " + string(global.enemiesDefeated) + "\nTime: " + string(global.minute) + ":" + string(global.second));
