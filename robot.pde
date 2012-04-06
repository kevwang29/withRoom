public class myRobot

{

  public int myXpos, myYpos, myZpos, myRsize;

  public int myXtrans, myYtrans, myZtrans;

  public int animateCount, walkCount;

  public boolean moveForward, rotationForward;

  public float rotationCount;

  public Rectangle myRHead, myLArm, myWLLeg, myRArm, myWRLeg, myRTorso;

  public myCube myLLeg, myRLeg, myTorso, myHead; 

  public myRobot(int xpos, int ypos, int zpos, int rsize)

  {

    myXpos = xpos;

    myYpos = ypos;

    myZpos = zpos;

    moveForward = true;

    rotationForward = true;

    walkCount = 0;

    myXtrans =0;

    myYtrans=0;

    myZtrans=0;

    myRsize = rsize;

    myLLeg = new myCube(rsize);

    myRLeg = new myCube(rsize);

    myTorso = new myCube(rsize);

    myHead = new myCube(rsize);

    PVector temp = new PVector();

    temp.set(1,1,1);

    myRHead = new Rectangle(2,2,2, temp );

    myLArm = new Rectangle(1,4,1, temp);
    myRArm = new Rectangle(1,4,1, temp);

    myWLLeg = new Rectangle(1,1,4, temp);

    myWRLeg = new Rectangle(1,1,4,temp);

    myRTorso = new Rectangle(1,4,6,temp);

    animateCount = 0;

    

  }

  public void create()

  {

    fill(255,255,0);

    pushMatrix();

    translate(myXpos, myYpos, myZpos);

    pushMatrix();

    translate(6,7,2.5);

    scale(1,1,1);

    myWLLeg.toDraw();

    popMatrix();

    pushMatrix();

    translate(6,7,0);

    scale(1,1,1);

    myWRLeg.toDraw();

    popMatrix();

    

    pushMatrix();

    translate(4,0,0);

    myRTorso.toDraw();

    popMatrix();

    

    pushMatrix();

    translate(3,-2.5,1.5);

    myRHead.toDraw();

   

    popMatrix();

    

    pushMatrix();

    translate(4,.5,4.5);

    myLArm.addRotateX(-1.8-PI);

    myLArm.toDraw();



    popMatrix();
    
    pushMatrix();
    translate(4,.5,0);
    myRArm.addRotateX(-1+PI-.5);
    myRArm.toDraw();
    
    popMatrix();
    

    popMatrix();

    

  }

  public void walkArms(float forward)

  {

    if (walkCount == 0)

    {

      myLArm.addRotateZ(2*PI-forward*-0.2);
      myRArm.addRotateZ(forward*-.2);

      walkCount++;

    }

    else if (walkCount == 1)

    {

      myLArm.addRotateZ(2*PI-forward*-.4);
      myRArm.addRotateZ(forward*-.4);
      walkCount++;

    }

    else if (walkCount ==2)

    {      

      myLArm.addRotateZ(2*PI-forward*-.6);
      myRArm.addRotateZ(forward*-.4);
      walkCount++;

    }

    else if (walkCount ==3)

    {

      myLArm.addRotateZ(2*PI-forward*-.8);
      myRArm.addRotateZ(forward*-.4);
      walkCount ++;

    }

    else if (walkCount ==4)

    {

      myLArm.addRotateZ(2*PI-forward*-1);
      myRArm.addRotateZ(forward*-1);
      walkCount ++;

    }

    else if (walkCount ==5)

    {

      myLArm.addRotateZ(2*PI-forward*-1.2);
      myRArm.addRotateZ(forward*-1.2);
      walkCount = 0;

    }

    

  }

  

  public void deal()

  {

    if (animateCount ==0)

    {

      myLArm.addRotateY(-1);

      animateCount++;

    }

    else if (animateCount == 1)

    {

      myLArm.addRotateY(-1.5);

      animateCount++;

    }

    else if (animateCount ==2)

    {      

      myLArm.addRotateY(-1.75);

      animateCount++;

    }

    else if (animateCount ==3)

    {

      myLArm.addRotateY(-2);

      animateCount ++;

    }

    else if (animateCount ==4)

    {

      myLArm.addRotateY(-2.5);

      animateCount ++;

    }

    else if (animateCount ==5)

    {

      myLArm.addRotateY(-2.75);

      animateCount = 0;

    }

    

    

    

  

  }

  

  public void animateWalker()

  {



    

    if (rotationForward)

    {

      rotationCount = rotationCount + PI/20;
          walkArms(1);
    }

    else

    {

      rotationCount = rotationCount - PI/20;
      walkArms(-1);

    }

    if (rotationCount > PI/5)

    {

      rotationForward = false;

    }

    if (rotationCount < -PI/5)

    {

      rotationForward = true;

    }

    

    myWLLeg.addRotateZ(rotationCount);

    myWRLeg.addRotateZ(PI/10 - rotationCount);

    

    

    PVector temp = new PVector();

    

    if (moveForward)

    {

      myXtrans++;

    }

    else

    {

      myXtrans--;

    }

    if (myXtrans < -20)

    {

      moveForward = true;

    }

    if (myXtrans > 20)

    {

      moveForward = false;

    }

    

    temp.set(myXtrans,myYtrans,myZtrans);

    myLArm.addTranslate(temp);

    myRTorso.addTranslate(temp);

    myRHead.addTranslate(temp);

    myWLLeg.addTranslate(temp);

    myWRLeg.addTranslate(temp);
    myRArm.addTranslate(temp);

  }

  

  public void resetAnimation()

  {

    myLArm.resetRotation();

  }

  

  

  

  

}

