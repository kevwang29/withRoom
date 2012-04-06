
public class myCube
{
  int myScaleVar;


  public myCube(int scaleVar)
  {
    myScaleVar = scaleVar;
  }

  public void createTextured()
  {
    final int[][] myFaces = {
      { 
        1, 3, 6, 5
      }
      , 
      { 
        0, 2, 7, 4
      }
      , 
      { 
        0, 2, 3, 1
      }
      , 
      { 
        7, 6, 5, 4
      }
      , 
      { 
        2, 3, 6, 7
      }
      , 
      { 
        0, 1, 5, 4
      }
    };
    final PVector[] myVertices = {

      new PVector(0, 1, 0), 
      new PVector( 1, 1, 0), 
      new PVector(0, 1, 1), 
      new PVector( 1, 1, 1), 
      new PVector(0, 0, 0), 
      new PVector( 1, 0, 0), 
      new PVector( 1, 0, 1), 
      new PVector(0, 0, 1)
      };
      beginShape(QUADS);
    for (int f = 0; f < myFaces.length; f++)
    {


      if (f == 3)
      {
        int[] myTemp = myFaces[f];

        PImage myTexture = loadImage("blackjacktable1.jpg");
        textureMode(NORMALIZED);
        texture(myTexture);

        vertex(myVertices[myTemp[0]].x, myVertices[myTemp[0]].y, myVertices[myTemp[0]].z, 0, 0);
        vertex(myVertices[myTemp[1]].x, myVertices[myTemp[1]].y, myVertices[myTemp[1]].z, 0, 1);
        vertex(myVertices[myTemp[2]].x, myVertices[myTemp[2]].y, myVertices[myTemp[2]].z, 1, 1);
        vertex(myVertices[myTemp[3]].x, myVertices[myTemp[3]].y, myVertices[myTemp[3]].z, 1, 0);
      }

      else
      {

        for (int i : myFaces[f])
        {
          vertex(myVertices[i].x, myVertices[i].y, myVertices[i].z);
        }
      }
    }
    endShape();
  }





  public void createLong()
  {
    final int[][] myFaces = {
      { 
        1, 3, 6, 5
      }
      , 
      { 
        0, 2, 7, 4
      }
      , 
      { 
        0, 2, 3, 1
      }
      , 
      { 
        7, 6, 5, 4
      }
      , 
      { 
        2, 3, 6, 7
      }
      , 
      { 
        0, 1, 5, 4
      }
    };
    final PVector[] myVertices = {

      new PVector(-myScaleVar, 1, -1), 
      new PVector( 1, 1, -1), 
      new PVector(-myScaleVar, 1, 1), 
      new PVector( 1, 1, 1), 
      new PVector(-myScaleVar, -1, -1), 
      new PVector( 1, -1, -1), 
      new PVector( 1, -1, 1), 
      new PVector(-myScaleVar, -1, 1)
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

  public void createTall()
  {
    final int[][] myFaces = {
      { 
        1, 3, 6, 5
      }
      , 
      { 
        0, 2, 7, 4
      }
      , 
      { 
        0, 2, 3, 1
      }
      , 
      { 
        7, 6, 5, 4
      }
      , 
      { 
        2, 3, 6, 7
      }
      , 
      { 
        0, 1, 5, 4
      }
    };
    final PVector[] myVertices = {
      new PVector(-1, 1, -1), 
      new PVector( 1, 1, -1), 
      new PVector(-1, 1, 1), 
      new PVector( 1, 1, 1), 
      new PVector(-1, -myScaleVar, -1), 
      new PVector( 1, -myScaleVar, -1), 
      new PVector( 1, -myScaleVar, 1), 
      new PVector(-1, -myScaleVar, 1)
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


