import processing.video.*;

Capture cam1;
Capture cam2;


PImage[] frame1;
PImage[] frame2;

int w = 640;
int h = 480;
int fps = 24;  // frames per second

//int nFrames1 = 24;  // buffer size in frames for camera 1 (1.00 sec)
//int nFrames2 = 24;  // buffer size in frames for camera 2 (1.00 sec)

int iWrite1 = 0, iRead1 = 1;
int iWrite2 = 0, iRead2 = 1;


void setup(){
  
  size(w, h);
  frameRate(fps);
  
  // instantiate the cameras, start them
  
  cam1 = new Capture(this, w, h);
  cam1.start();
  
  cam2 = new Capture(this, w/3, h/3);
  cam2.start();
  
}

void draw() {
  
if(cam1.available()) {
  
    cam1.read();
    cam2.read();

      
    frame1[iWrite1] = cam1.get();
    frame2[iWrite2] = cam2.get();

      
    if(frame1[iRead1] != null){
  
      //tint(255, 50); // set the transparency, applied to all cameras

      image(frame2[iRead2], 0, 0);
      image(frame1[iRead1], 0, 0);

  }

  }
    iWrite1++;
    iWrite2++;
    iRead1++;
    iRead2++;

         
}
