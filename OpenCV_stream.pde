import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;
import java.util.Arrays;

OpenCV opencv;
Rectangle[] faces;
Capture video1;

void captureEvent(Capture video1) {
  video1.read();
  
  video1 = new Capture(this, 640, 480);

  video1.start();
}


// to store images
PImage backgroundImg;
PImage movementImg;                 //  Creates a new PImage to hold the movement image


void setup() {
  opencv = new OpenCV(this, 640, 480);
  size(opencv.width, opencv.height);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
}

void draw() {
  opencv.loadPixels();
  image(opencv.getInput(), 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  opencv.updatePixels();
}
