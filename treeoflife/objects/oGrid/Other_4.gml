// First step of pathfinding algorithm
// Fill the grid to see if there is a collision object
var hcells = ceil(room_width/oGrid.cell_width);
var vcells = ceil(room_height/oGrid.cell_height);

global.ds_grid_pathfinding = ds_grid_create(hcells, vcells);
for (var i=0; i<hcells; i+=1) {
    for (var j=0; j<vcells; j+=1) {
        if place_meeting(i*oGrid.cell_width,j*oGrid.cell_height,oCollision) {
        ds_grid_add(global.ds_grid_pathfinding,i,j,-2)
        } else {
        ds_grid_add(global.ds_grid_pathfinding,i,j,-1)
        }
    }
}