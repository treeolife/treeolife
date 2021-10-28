
bufferX = 50;   // buffer left and right outsite from camera

emitterLava   = part_emitter_create(oParticlesSetup.particle_system);
emitterHeat   = part_emitter_create(oParticlesSetup.particle_system);
 
// Capture x,y and with + height of camera 0
xStart       = camera_get_view_x(view_camera[0]);
yStart       = camera_get_view_y(view_camera[0]);
 
CameraWidth  = camera_get_view_width(view_camera[0]);
CameraHeight = camera_get_view_height(view_camera[0]);
 
 
// Blank emitter, region/space to use , stream

// Create thick heat cloud
part_emitter_region(oParticlesSetup.particle_system, emitterHeat,  xStart , xStart + CameraWidth  , yStart , yStart + CameraHeight , ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(oParticlesSetup.particle_system, emitterHeat, oParticlesSetup.particleType_Heat_Red, 12);  
 
   
// Create lava sparks
part_emitter_region(oParticlesSetup.particle_system, emitterLava,  xStart - bufferX, xStart + CameraWidth + bufferX  , yStart + CameraHeight  , yStart + CameraHeight , ps_shape_line, ps_distr_linear);
part_emitter_stream(oParticlesSetup.particle_system, emitterLava, oParticlesSetup.particleType_Lava_Red, -30);  
 
 
 

 

 
 
