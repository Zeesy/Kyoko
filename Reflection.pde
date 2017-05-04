//Import libraries for OpenCV and video

import gab.opencv.*;

import processing.video.*;

import java.awt.Rectangle;

//Step 2. Declare three capture objects: video1 for background, video2 to track face with openCV,
//and merger to combine video1 with applied blur to tracked area from video2
Capture video1;
Capture video2;
merger mg1=new merger();

//declare OpenCV object and ellipse for blurmask
OpenCV opencv;
Rectangle[] faces;

// Step 5. Read from the camera when a new image is available!
void captureEvent(Capture video1) {
  video1.read();
}

void setup() {  
  size(640, 480);
  
  // Step 3. Initialize Capture object.
  video1 = new Capture(this, 640, 480);
  video2 = new Capture(this, 160, 120);

  // Step 4. Start the capturing process.
  video1.start();
}


void draw() {
  mg1.merge();
  }


class merger {
merger() {
  
  } 
  void merge(){
    pushMatrix(); 
    translate(video1.width,0); 
    scale(-1.0,1.0); 
    image(video1,0,0); 
    popMatrix();
  }
}

