x1 = bbox_left;
y1 = bbox_top;
x2 = bbox_right;
y2 = bbox_bottom;
x3 = obj_player.bbox_left;
y3 = obj_player.bbox_top;
x4 = obj_player.bbox_right;
y4 = obj_player.bbox_bottom;
    if (rectangle_in_rectangle(x3, y3, x4, y4, x1, y1, x2, y2) == 1) // Only true if you're completely inside a block
    {
        ALERTTIME = true;
		show_debug_message("HOMO");
    }
	else{
		ALERTTIME = false;
	}
	