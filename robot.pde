

public class myRobot
{
  public int myXpos, myYpos, myZpos, myRsize;
  public myCube myLLeg, myRLeg, myTorso, myLArm, myRArm, myHead; 
  public myRobot(int xpos, int ypos, int zpos, int rsize)
  {
    myXpos = xpos;
    myYpos = ypos;
    myZpos = zpos;
    myRsize = rsize;
    myLLeg = new myCube(rsize);
    myRLeg = new myCube(rsize);
    myTorso = new myCube(rsize);
    myHead = new myCube(rsize);
    
    
  }
  public void create()
  {
    fill(255,255,0);
    pushMatrix();
    translate(myXpos, myYpos, myZpos);
    pushMatrix();
    translate(6,7,2);
    scale(1,1,1);
    myLLeg.createLong();
    popMatrix();
    pushMatrix();
    translate(6,7,-2);
    scale(1,1,1);
    myRLeg.createLong();
    popMatrix();
    
    pushMatrix();
    translate(6,2.2,0);
    scale(1,2.5,2.5);
    myTorso.createLong();
    popMatrix();
    
    pushMatrix();
    translate(6,-2,0);
    scale(1.4,1.4,1.4);
    myHead.createLong();
    
    popMatrix();
    
    
    popMatrix();
    
  }
  
  
}

