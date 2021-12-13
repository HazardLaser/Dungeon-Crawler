#macro TS 8


var _w = ceil(room_width / TS);
var _h = ceil(room_height / TS);

//motion planning grid
global.mp_grid = mp_grid_create(0,0, _w, _h, TS, TS);

//add solids to grid
mp_grid_add_instances(global.mp_grid,obj_pillar, false);
mp_grid_add_instances(global.mp_grid,obj_horizontalWall, false);
mp_grid_add_instances(global.mp_grid,obj_verticalWall, false);
mp_grid_add_instances(global.mp_grid,obj_vase, true);
mp_grid_add_instances(global.mp_grid,obj_verticalWallLong, false);
mp_grid_add_instances(global.mp_grid,obj_lockNorth, false);
mp_grid_add_instances(global.mp_grid,obj_lockWest, false);
mp_grid_add_instances(global.mp_grid,obj_lockSouth, false);
mp_grid_add_instances(global.mp_grid,obj_lockEast, false);