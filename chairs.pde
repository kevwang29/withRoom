public class mychair
{
  myCube chairLeg1 = new myCube(2);
  myCube chairLeg2 = new myCube(2);
  myCube chairLeg3 = new myCube(2);
  myCube chairLeg4 = new myCube(2);
  myCube seat = new myCube(4);
  myCube back = new myCube(4);
  public mychair()
  {
  }
  
  public void create()
  {
    fill(0, 20, 70);
    pushMatrix();
    translate(0, .5, 20);
    scale(.5, .5, .3);
    //translate(10, -30, 0);
    chairLeg1.createTall();
    popMatrix();
    
    fill(0, 20, 70);
    pushMatrix();
    translate(0, .5, 18);
    scale(.5, .5, .3);
    //translate(10, -30, 0);
    chairLeg2.createTall();
    popMatrix();
    
    fill(0, 20, 70);
    pushMatrix();
    translate(3, .5, 20);
    scale(.5, .5, .3);
    //translate(10, -30, 0);
    chairLeg3.createTall();
    popMatrix();
    
    fill(0, 20, 70);
    pushMatrix();
    translate(3, .5, 18);
    scale(.5, .5, .3);
    //translate(10, -30, 0);
    chairLeg4.createTall();
    popMatrix();
    
    fill(188, 189, 220);
    pushMatrix();
    translate(2, -.7, 19);
    scale(.7, .2, 1.37);
    seat.createLong();
    popMatrix();
    
    fill(188, 189, 220);
    pushMatrix();
    translate(3, -2.7, 19);
    scale(.1, 2, 1.35);
    back.createLong();
    popMatrix();
    
  }
  
}
