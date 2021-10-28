bufferX = 500;   // buffer left and right outsite from camera
bufferY = 10;     // buffer up from starting camera y
  
xStart =   camera_get_view_x(view_camera[0]);
yStart =   camera_get_view_y(view_camera[0]);
 
CameraWidth = camera_get_view_width(view_camera[0]);
 
 
// Blank emitter, region/space to use , stream
emitterLeaf = part_emitter_create(oParticlesSetup.particle_system);
 
// Create leafes
part_emitter_region(oParticlesSetup.particle_system, emitterLeaf,  xStart - bufferX , xStart + CameraWidth + bufferX   , yStart - bufferY, yStart -bufferY, ps_shape_line, ps_distr_linear   );
part_emitter_stream(oParticlesSetup.particle_system, emitterLeaf, oParticlesSetup.particleType_Leaf_West, -10);  
 
 
 


 
 

 

 
 
