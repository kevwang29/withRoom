//main class

boolean isSmooth = true;
boolean isWireFrame = false;
boolean isRunning = true;
float angle = 0;
myCube room = new myCube(2);
myTable table1 = new myTable(252, 141, 89, 145, 191, 219);
myTable table2 = new myTable(252, 141, 89, 145, 191, 219);
myTable table3 = new myTable(252, 141, 89, 145, 191, 219);
myRobot rob = new myRobot(2,-5,0,1);
myRobot walker = new myRobot(2,-6, 0, 1);
myRobot walker2 = new myRobot(2,-6,0,1);
Card myCard;
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
import processing.opengl.*;
import codeanticode.glgraphics.*;


Minim minim; 
AudioPlayer song;



void setup ()
{
  myCard = new Card(new PVector(0, -25, 0));
  minim = new Minim(this);
  size(1000, 1000, P3D);  
//  xcamera = 225;
//  ycamera = 185;
//  zcamera = 61;
//  xcenter = 710;
//  ycenter = 410;
//  zcenter = -30;


  xcamera = 305;
  ycamera = 240;
  zcamera = 26;
  xcenter = 870;
  ycenter = 520;
  zcenter = -100;

//  xcamera = 120;
//  ycamera = 230;
//  zcamera = 36;
//  xcenter = 490;
//  ycenter = 500;
//  zcenter = -80;
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
//  translate(width/2, height/2, 0);
//  scale(100);
  translate(500, 100, 0);
  scale(200);
  //room.draw(isSmooth);
  room.createLong();
  popMatrix(); 

  //center table number 1
  pushMatrix();
  translate(370, 279.9, 0);
  myCard.toDraw(millis());
  popMatrix();
  pushMatrix();
  translate(370, 276.9, 0);
  scale(3);
  table1.create();
  //rob.create();
  //rob.deal();

  popMatrix();  
  
  
  //center table number 2
  pushMatrix();
  translate(280, 276.9, 0);
  scale(3);
  table2.create();
  
  pushMatrix();
  translate(0,0,20);
//  
  walker.create();
  walker.animateWalker();
  popMatrix();
  
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
  case '1':
     myCard.toDealCard(millis(), -13.2, new PVector(-7,0,0));
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

