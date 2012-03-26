public class myTable
{
  
  myCube tableStand = new myCube(3);
  myCube tableTop = new myCube(6);
  public int standColX, standColY, standColZ; //color of stand
  public int tableTopX, tableTopY, tableTopZ; //color of table top
  mychair chair = new mychair();
  public myTable(int scX, int scY, int scZ, int ttX, int ttY, int ttZ)
  {
    standColX = scX;
    standColY = scY;
    standColZ = scZ;
    tableTopX = ttX;
    tableTopY = ttY;
    tableTopZ = ttZ;
  }
  
  public void create()
  {
    fill(standColX, standColY, standColZ);
    tableStand.createTall();
    //fill(30, 100, 200);
    //translate(0, 20, 0);
    
    pushMatrix();
    scale(1.3,.2,8);
    translate(2,-15,0);
    fill(tableTopX, tableTopY, tableTopZ);
    tableTop.createLong();
    popMatrix();
    
    pushMatrix();
    rotateY(1.5);
    translate(10, 0, -20);
    chair.create();
    popMatrix();
    
    pushMatrix();
    rotateY(-1.5);
    translate(10, 0, -20);
    chair.create();
    popMatrix();
    
    pushMatrix();
    rotateY(3.2);
    translate(5, 0, -22);
    chair.create();
    popMatrix();
    
    pushMatrix();
    rotateY(3.2);
    translate(5, 0, -15);
    chair.create();
    popMatrix();
  }
  
}
