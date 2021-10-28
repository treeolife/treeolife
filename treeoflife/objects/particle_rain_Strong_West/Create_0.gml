image_alpha = 0;  // don't show in game

bufferX = 800;   // buffer left and right outsite from camera
bufferY = 50;     // buffer up from starting camera y

 // Capture x,y and with + height of camera 0
xStart = camera_get_view_x( view_camera[0] );
yStart = camera_get_view_y( view_camera[0] );
CameraWidth = camera_get_view_width(view_camera[0]);

 // Blank emitter, region/space to use , stream
emitterRain = part_emitter_create(oParticlesSetup.particle_system);

  // Create rain
part_emitter_region(oParticlesSetup.particle_system, emitterRain, xStart - bufferX , xStart + CameraWidth + bufferX, yStart -bufferY, yStart - bufferY, ps_shape_rectangle,ps_distr_linear   );
part_emitter_stream(oParticlesSetup.particle_system, emitterRain, oParticlesSetup.particleType_Rain_StrongWest, 30  );

