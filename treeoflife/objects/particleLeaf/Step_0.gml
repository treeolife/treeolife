/// @description Delete if no needed

// delete the step event if the particle weather system doesn't need moving with the camera

//updates the current x and y of the camera
xStart = camera_get_view_x( view_camera[0] );
yStart = camera_get_view_y( view_camera[0] );

// updates the emitter region place to spawn new particles
 part_emitter_region(oParticlesSetup.particle_system, emitterLeaf,  xStart - bufferX , xStart + CameraWidth + bufferX   , yStart - 10, yStart -10, ps_shape_line, ps_distr_linear   );