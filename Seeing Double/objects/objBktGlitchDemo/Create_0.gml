//////////////////////////////////
//                              //
//   bktGlitch 1.3.2            //
//    Written by Jan Vorisek    //
//    @odditica | odditica.fyi  //
//      jan@odditica.fyi        //
//       02/07/2022             //
//                              //
//     "Here we go again."      //
//							 	//
//////////////////////////////////

/*
    See Draw GUI for setup instructions.
    
    Easier example available in objSimpleExample, change the room order to see it in action.
*/

// You can init the shader here manually if you want, otherwise it will be done automatically the first
// time you run BktGlitch_activate(), which might take a few frames.
bktglitch_init()
application_surface_draw_enable(false); // disabling automatic redrawing of the application surface
//display_set_gui_size(1280, 720); // hard-coding GUI size to HD

__bktgtlich_ui_init();

intensity = 0.000000;
intensityMax = 1.000000;
intensityMax2 = 1.500000;

intensityMaxTiny = 0.200000;
intensityMaxSmall = 0.500000;
intensityMaxLarge = 1.000000;

intensityIncrementType = INCREMENT_TYPE.NONE;

//increasingIntensityToMaxTiny = false;
//increasingIntensityToMaxSmall = false;
//increasingIntensityToMaxLarge = false;
//
//decreasingIntensityToZero = false;

intensityIncreaseAmount = 0.001;
intensityIncreaseAmount2 = 0.001;
intensityDecreaseAmount = 0.003;
intensityDecreaseAmount2 = 0.002;


channelShift = 0.000000;
channelShiftMax = 0.034667;

channelShiftIncreaseAmount = 0.00001;
channelShiftDecreaseAmount = 0.00005;


channelDispersion = 0.000000;
channelDispersionMax = 0.020000;

channelDispersionIncreaseAmount = 0.00001;
channelDispersionDecreaseAmount = 0.00005;









// 1. Get the handle for the new uniform
u_split_pos = shader_get_uniform(shdBktGlitch, "split_position");

// 2. Create your toggle variable
enable_split_screen = false;