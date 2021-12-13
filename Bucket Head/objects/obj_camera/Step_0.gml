/// @description Insert description here
// You can write your code in this editor
if(object_exists(obj_player)){
#region HORIZONTAL

	var left_border = view_x;
	var right_border = view_width + (view_width * (segment_x - 1));
	
	if(target.x > right_border) {
		segment_x += 1;
	} 
	else if(target.x < left_border) {
		segment_x -= 1;
	}

#endregion

#region VERTICAL

	var top_border = view_y;
	var bottom_border = view_height + (view_height * (segment_y - 1));
	
	if(target.y > bottom_border) {
		segment_y += 1;
	} 
	else if(target.y < top_border) {
		segment_y -= 1;
	}
#endregion

camera_set_view_pos(camera, view_width * (segment_x - 1), view_height *(segment_y - 1));
view_x = camera_get_view_x(camera);
view_y = camera_get_view_y(camera);
}