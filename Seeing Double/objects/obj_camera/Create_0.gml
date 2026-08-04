view_width = 1920/4;  //The higher the number on the right the better
view_height = 1080/4;   //4

freeze = false; //Freeze camera during certain cutscenes

window_scale = 3; //Scale window to 3 times the size of my view so it won't be super tiny


//Set window size
window_set_size(view_width*window_scale, view_height*window_scale);

//Center the view on the monitor, use an alarm since it has to happen one step after you set the window size
//Otherwise the new size will not be taken into account when you call the new center
alarm[0] = 1; //Alarm 0 calls window_center()

//Resize our application surface, which controls how much of the pixels in our window we are actually using
//The higher the number - up to the size of the window - the more resolution you have to work with, and the smooother things can scroll

//Resize it to be equal to our window
surface_resize(application_surface, view_width*window_scale, view_height*window_scale)

cameraLeadingX = 0;
pitterCameraLeadingX = 0;
patterCameraLeadingX = 0;
cameraLeadingXmax = 40; //How far the camera leads the player 
cameraLeadingXMinecartMax = 80; //How far the camera leads the player during minecart rides
cameraLeadAdjustSpeedX = 0.75; //How fast the camera moves when leading the player
cameraLeadAdjustSpeedMinecartX = 1.5; //How fast the camera moves when leading the player during minecart rides

cameraLockedForward = false; //Check if camera is locked forward for minecart segments

pitterCameraOffsetY = 0;

patterCameraOffsetX = global.patterOffsetX;
patterCameraOffsetY = global.patterOffsetY;



verticalLevelOffsetY = -100;
verticalLevelOffsetYMin = -150;
verticalLevelOffsetYMax = -100;
//verticalLevelOffsetYMax = 200;

verticalLevelOffsetYUpdateAmount = 2;


//Camera shake variables
shake_length = 0;    // How long the shake lasts (in frames)
shake_magnitude = 0; // How intense the shake is
shake_remain = 0;    // The current remaining intensity