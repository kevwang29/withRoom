//main class

boolean isSmooth = true;
boolean isWireFrame = false;
boolean isRunning = true;
float angle = 0;
myCube room = new myCube(2);
myTable table1 = new myTable(252, 141, 89, 145, 191, 219);
myTable table2 = new myTable(252, 141, 89, 145, 191, 219);
myTable table3 = new myTable(252, 141, 89, 145, 191, 219);
float xcamera;
float ycamera;
float zcamera;
float xcenter;
float ycenter;
float zcenter;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim; 
AudioPlayer song;



void setup ()
{
  minim = new Minim(this);
  size(640, 360, P3D);  
  xcamera = 120;
  ycamera = 230;
  zcamera = 76;
  xcenter = width/2;
  ycenter = height/2;
  zcenter = 0;
  song = minim.loadFile("crowdTalking.wav", 2048);
  // song.loop();
}


void draw ()
{
  // clear background for redraw
  smooth();
  background(0, 0, 0);
  // basic lighting setup
  camera(xcamera, ycamera, zcamera, xcenter, ycenter, zcenter, 0, 1, 0);
  lights();
  pointLight(128, 128, 128, 340, 80, -94);
  // wireframe or solid
  if (isWireFrame)
  {
    stroke(255, 255, 150);
    noFill();
  } 
  else
  {
    noStroke();
    fill(255, 255, 191);
  }

  // center scene
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(100);
  //room.draw(isSmooth);
  room.createLong();
  popMatrix(); 

  //center table number 1
  pushMatrix();
  translate(370, 276.9, 0);
  scale(3);
  table1.create();
  popMatrix();  

  //center table number 2
  pushMatrix();
  translate(280, 276.9, 0);
  scale(3);
  table2.create();
  popMatrix();   


  //center table number 3
  pushMatrix();
  translate(190, 276.9, 0);
  scale(3);
  table3.create();
  popMatrix();
}


void keyPressed ()
{
  float increment = 10;  
  switch (key)
  {
  case 'w':
    isWireFrame = ! isWireFrame;
    break;
  case 's':
    isSmooth = ! isSmooth;
    break;
  case ' ':
    isRunning = ! isRunning;
    break;
  }
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      xcamera= xcamera+5;
      xcenter +=increment;
    }
    if (keyCode == DOWN)
    {
      xcamera = xcamera-5;
      xcenter-=increment;
    }
    if (keyCode == LEFT)
    {
      zcamera = zcamera -5;
      zcenter -=increment;
    }
    if (keyCode == RIGHT)
    {
      zcamera = zcamera + 5;
      zcenter += increment;
    }
  }
  if (key == 'r')
  {
    ycamera = ycamera-5;
    ycenter-=increment;
  }
  if (key == 'f')
  {
    ycamera= ycamera+5;
    ycenter +=increment;
  }
  println("xcenter is" + xcenter);
  println("ycenter is" + ycenter);
  println("zcenter is" + zcenter);
  println("xcamera is" + xcamera);
  println("ycamera is" + ycamera);
  println("zcamera is" + zcamera);
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

