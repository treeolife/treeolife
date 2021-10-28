particle_system = part_system_create_layer("Weather", 0);  

image_alpha = 0;

#region Rain

particleType_Rain_StrongWest = part_type_create();

part_type_sprite(particleType_Rain_StrongWest, spr_Particle_Rain_Hard__LightBlue, 0,0,1 );
part_type_size(particleType_Rain_StrongWest, 2,2, 0,0);
part_type_gravity(particleType_Rain_StrongWest, 0.05, 250);
part_type_life(particleType_Rain_StrongWest, 150,200);
part_type_orientation(particleType_Rain_StrongWest, 330, 330 , 0,0,0 );


particleType_Rain_StrongEast = part_type_create();

part_type_sprite(particleType_Rain_StrongEast, spr_Particle_Rain_Hard__LightBlue, 0,0,1 );
part_type_size(particleType_Rain_StrongEast, 2,2, 0,0);
part_type_gravity(particleType_Rain_StrongEast, 0.05, 290);
part_type_life(particleType_Rain_StrongEast, 150,200);
part_type_orientation(particleType_Rain_StrongEast, 20, 20 , 0,0,0 );


particleType_Rain_StrongDown = part_type_create();

part_type_sprite(particleType_Rain_StrongEast, spr_Particle_Rain_Hard__LightBlue, 0,0,1 );
part_type_size(particleType_Rain_StrongEast, 2,2, 0,0);
part_type_gravity(particleType_Rain_StrongEast, 0.05, 270);
part_type_life(particleType_Rain_StrongEast, 150,200);
part_type_orientation(particleType_Rain_StrongEast, 0, 0 , 0,0,0 );





particleType_Rain_MildWest = part_type_create();

part_type_sprite(particleType_Rain_MildWest, spr_Particle_Rain_Soft__LightBlue, 0,0,1 );
part_type_size(particleType_Rain_MildWest, 2,2, 0,0);
part_type_gravity(particleType_Rain_MildWest, 0.03, 260);
part_type_life(particleType_Rain_MildWest, 400,400);
part_type_orientation(particleType_Rain_MildWest, 350, 350 , 0,0,0 );


particleType_Rain_MildEast = part_type_create();

part_type_sprite(particleType_Rain_MildEast, spr_Particle_Rain_Soft__LightBlue, 0,0,1 );
part_type_size(particleType_Rain_MildEast, 2,2, 0,0);
part_type_gravity(particleType_Rain_MildEast, 0.03, 280);
part_type_life(particleType_Rain_MildEast, 400,400);
part_type_orientation(particleType_Rain_MildEast, 20, 20 , 0,0,0 );


particleType_Rain_MildDown = part_type_create();

part_type_sprite(particleType_Rain_MildDown, spr_Particle_Rain_Soft__LightBlue, 0,0,1 );
part_type_size(particleType_Rain_MildDown, 2,2, 0,0);
part_type_gravity(particleType_Rain_MildDown, 0.03, 270);
part_type_life(particleType_Rain_MildDown, 400,400);
part_type_orientation(particleType_Rain_MildDown, 0, 0 , 0,0,0 );



#endregion

#region Leaf

particleType_Leaf_West = part_type_create(); 

part_type_sprite(particleType_Leaf_West, sParticleLeaf, 0, 0 ,1);  
part_type_size(particleType_Leaf_West, 1,2.5,0, 0.05);
//part_type_gravity(particleType_Leaf_West, 0.005, 270); // soft falling
part_type_speed(particleType_Leaf_West, 1.2,1.2, 0, 0);   
part_type_direction(particleType_Leaf_West, 200, 240, 0, 0); 
part_type_orientation(particleType_Leaf_West, 0,359 , 0,2, 0);
part_type_life(particleType_Leaf_West, 680,840 );
part_type_alpha3(particleType_Leaf_West, 0.8,0.7,0.1);


particleType_Leaf_East = part_type_create(); 

part_type_sprite(particleType_Leaf_East, sParticleLeaf, 0, 0 ,1);  
part_type_size(particleType_Leaf_East, 1,2.5,0, 0.05);
//part_type_gravity(particleType_Leaf_East, 0.005, 270); // soft falling
part_type_speed(particleType_Leaf_East, 1.2,1.2, 0, 0);   
part_type_direction(particleType_Leaf_East, 200, 240, 0, 0); 
part_type_direction(particleType_Leaf_East, 300, 340, 0, 0); 
part_type_orientation(particleType_Leaf_East, 0,359 , 0,2, 0);
part_type_life(particleType_Leaf_East, 680,840 );
part_type_alpha3(particleType_Leaf_East, 0.8,0.7,0.1);

#endregion

#region Lava spot

// lava on one spot
particleType_Lava = part_type_create(); 

part_type_sprite(particleType_Lava, sParticleLava2, 0, 0 ,1);  
part_type_size(particleType_Lava, 0.5,1.8,0, 0);

part_type_speed(particleType_Lava,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava, 90, 90, 0, 0); // Wiggle west

part_type_orientation(particleType_Lava, 0,359 , 0,15, 0);
part_type_life(particleType_Lava, 80,300 );
part_type_alpha3(particleType_Lava, 0.8,0.6,0.1);



particleType_Heat = part_type_create(); 

part_type_shape(particleType_Heat, pt_shape_smoke );
part_type_size(particleType_Heat, 0.5,0.4,0.001, 0);

part_type_speed(particleType_Heat, 0.005,0.001, 0, 0);  
part_type_direction(particleType_Heat, 90, 90, 0, 15); 

part_type_color3(particleType_Heat,9955, 809204 ,3454463 );
part_type_orientation(particleType_Heat, 0,359 , 0,0, 0);
part_type_life(particleType_Heat, 300,450 );
part_type_blend(particleType_Heat, 1);
part_type_alpha3(particleType_Heat, 0.001, 0.02, 0.001);
//part_type_alpha1(particleType_Heat, 1);


#endregion

#region Heat Embers Red
// lava whole camera
particleType_Lava_Red = part_type_create(); 

part_type_sprite(particleType_Lava_Red, sParticleEmber, 0, 0 ,1);  
part_type_size(particleType_Lava_Red, 0.05,1.2,0, 0);
part_type_color3(particleType_Lava_Red,9955, 809204 ,3454463 );
part_type_speed(particleType_Lava_Red,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava_Red, 70, 110, 0, 2); // Wiggle west
part_type_blend(particleType_Lava_Red, 1);
part_type_orientation(particleType_Lava_Red, 0,359 , 0, 0, 0);
part_type_life(particleType_Lava_Red, 3200,3800 );
part_type_alpha3(particleType_Lava_Red, 0.8,0.4,0.1);



particleType_Heat_Red = part_type_create(); 

part_type_shape(particleType_Heat_Red, pt_shape_smoke );
part_type_size(particleType_Heat_Red, 2,3,0.001, 0);
part_type_speed(particleType_Heat_Red, 0,0, 0, 0);  
part_type_direction(particleType_Heat_Red, 90, 90, 0, 15); 
part_type_color3(particleType_Heat_Red,9955, 809204 ,3454463 );
part_type_orientation(particleType_Heat_Red, 0,359 , 0,0, 0);
part_type_life(particleType_Heat_Red, 300,450 );
part_type_blend(particleType_Heat_Red, 1);
part_type_alpha3(particleType_Heat_Red, 0.001, 0.005, 0.001);

#endregion