
public class Rectangle1
{
  float myLength, myWidth, myHeight;
  String[] texturePicture = new String[6];
  int[] textureOrientation = new int[] { 
    -1, -1, -1, -1, -1, -1
  };
  PVector myLocation;
  final PVector[] myVertices;
  int[][] myFaces;
  boolean debug = false;



  public Rectangle1(float rectLength, float rectWidth, float rectHeight, PVector location)
  {
    myLength = rectLength;
    myWidth = rectWidth;
    myHeight = rectHeight;
    

    myLocation = location;

    int[][] faces = {
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
    PVector[] vertices = {
      new PVector(0, 1, 0), 
      new PVector( 1, 1, 0), 
      new PVector(0, 1, 1), 
      new PVector( 1, 1, 1), 
      new PVector(0, 0, 0), 
      new PVector( 1, 0, 0), 
      new PVector( 1, 0, 1), 
      new PVector(0, 0, 1)
      };
      
      myFaces = faces;
      myVertices = vertices;
      scale();
    }

    public Rectangle1(float rectLength, float rectWidth, float rectHeight) {
      this(rectLength, rectWidth, rectHeight, new PVector(0, 0, 0));
    } 

  public void toDraw()
  {  
    if(debug) println("start toDraw");
  
    
    for (int f = 0; f < myFaces.length; f++) {
    beginShape(QUADS);

      if (texturePicture[f]!= null)
      {
        int[] myTemp = myFaces[f];
        int[] textureX = new int[] {
          0, 0, 1, 1
        };
        int[] textureY = new int[] {
          0, 1, 1, 0
        };
        
        
        PImage myTexture = loadImage(texturePicture[f]);
        textureMode(NORMALIZED);
        texture(myTexture);
        for (int i=0; i<4; i++) {
          vertex(myVertices[myTemp[i]].x, myVertices[myTemp[i]].y, myVertices[myTemp[i]].z, textureX[(i+textureOrientation[f])%4], textureY[(i+textureOrientation[f])%4]);
          
        }
      }

      else
      {
        for (int i : myFaces[f])
        {
          vertex(myVertices[i].x, myVertices[i].y, myVertices[i].z);
        }
      }
      endShape();
    }
    
    
  }

  public void setTexture( int face, String fileName, int rotation) {
    texturePicture[face] = fileName;
    textureOrientation[face] = rotation;
  }

  public void removeTexture( int face) {
    texturePicture[face] = null;
    textureOrientation[face] = -1;
  }
  
  private void scale(){
     for(int i=0; i< myVertices.length; i++){
       myVertices[i].x= myVertices[i].x*myLength;
       myVertices[i].y= myVertices[i].y*myWidth;
       myVertices[i].z= myVertices[i].z*myHeight;
     }
  }
}

