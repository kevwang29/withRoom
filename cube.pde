public class myCube
{
  int myScaleVar;
  
  public myCube(int scaleVar)
  {
    myScaleVar = scaleVar;
  }
  
  
  public void createLong()
  {
      final int[][] myFaces = {
          { 1, 3, 6, 5 },
          { 0, 2, 7, 4 },
          { 0, 2, 3, 1 },
          { 7, 6, 5, 4 },
          { 2, 3, 6, 7 },
          { 0, 1, 5, 4 }
      };
      final PVector[] myVertices = {
          new PVector(-myScaleVar,  1, -1),
          new PVector( 1,  1, -1),
          new PVector(-myScaleVar,  1,  1),
          new PVector( 1,  1,  1),
          new PVector(-myScaleVar, -1, -1),
          new PVector( 1, -1, -1),
          new PVector( 1, -1,  1),
          new PVector(-myScaleVar, -1,  1) 
      };
//      PImage a = loadImage("skyImage.jpeg");
//      texture(a);
          beginShape(QUADS);
          for (int f = 0; f < myFaces.length; f++)
          {
              for (int i : myFaces[f])
              {
                  vertex(myVertices[i].x, myVertices[i].y, myVertices[i].z);
              }
          }
          endShape();
        } 

  public void createTall()
  {
      final int[][] myFaces = {
          { 1, 3, 6, 5 },
          { 0, 2, 7, 4 },
          { 0, 2, 3, 1 },
          { 7, 6, 5, 4 },
          { 2, 3, 6, 7 },
          { 0, 1, 5, 4 }
      };
      final PVector[] myVertices = {
          new PVector(-1,  1, -1),
          new PVector( 1,  1, -1),
          new PVector(-1,  1,  1),
          new PVector( 1,  1,  1),
          new PVector(-1, -myScaleVar, -1),
          new PVector( 1, -myScaleVar, -1),
          new PVector( 1, -myScaleVar,  1),
          new PVector(-1, -myScaleVar,  1) 
      };
          beginShape(QUADS);
          for (int f = 0; f < myFaces.length; f++)
          {
              for (int i : myFaces[f])
              {
                  vertex(myVertices[i].x, myVertices[i].y, myVertices[i].z);
              }
          }
          endShape();
        } 
}
