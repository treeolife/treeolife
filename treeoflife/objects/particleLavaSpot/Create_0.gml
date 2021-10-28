image_alpha = 0;

// Capture x,y and with + height of camera 0
xStart       = camera_get_view_x(view_camera[0]);
yStart       = camera_get_view_y(view_camera[0]);

CameraWidth  = camera_get_view_width(view_camera[0]);
CameraHeight = camera_get_view_height(view_camera[0]);
 
 
// Blank emitter, region/space to use , stream
// spefic lava and heat for a given area!
emitterLava = part_emitter_create(oParticlesSetup.particle_system);
emitterHeat = part_emitter_create(oParticlesSetup.particle_system);

sparks_x_min = x;
sparks_x_max = sparks_x_min + sprite_width;
sparks_y_min = y;
sparks_y_max = sparks_y_min;

heat_x_min = x;
heat_x_max = heat_x_min + sprite_width;
heat_y_min = y - 12;
heat_y_max = heat_y_min;


// Create lava sparks
part_emitter_region(oParticlesSetup.particle_system, emitterLava,  sparks_x_min, sparks_x_max,
					sparks_y_min, sparks_y_max, ps_shape_line, ps_distr_linear);
part_emitter_stream(oParticlesSetup.particle_system, emitterLava, oParticlesSetup.particleType_Lava, -20);  
 
// Create heat cloud
part_emitter_region(oParticlesSetup.particle_system, emitterHeat,  heat_x_min, heat_x_max,
					heat_y_min, heat_y_max, ps_shape_rectangle, ps_distr_linear   );
part_emitter_stream(oParticlesSetup.particle_system, emitterHeat, oParticlesSetup.particleType_Heat, -2);  


//// Create lava sparks
//part_emitter_region(oParticlesSetup.particle_system, emitterLava,  448, 700  , 448 , 448, ps_shape_line, ps_distr_linear   );
//part_emitter_stream(oParticlesSetup.particle_system, emitterLava, oParticlesSetup.particleType_Lava, -20);  
 
//// Create heat cloud
//part_emitter_region(oParticlesSetup.particle_system, emitterHeat,  452 , 700  , 440, 440 , ps_shape_rectangle, ps_distr_linear   );
//part_emitter_stream(oParticlesSetup.particle_system, emitterHeat, oParticlesSetup.particleType_Heat, -2);  
 