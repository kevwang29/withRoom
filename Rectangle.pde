
public class Rectangle
{
  int myLength, myWidth, myHeight;
  String[] texturePicture = new String[6];
  int[] textureOrientation = new int[] { 
    -1, -1, -1, -1, -1, -1
  };
  PVector myLocation;
  final PVector[] myVertices;
  int[][] myFaces;
  PVector translateAmount = new PVector(0, 0, 0);
  PVector rotationAmount = new PVector(0, 0, 0);



  public Rectangle(int rectLength, int rectWidth, int rectHeight, PVector location)
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
    }

    public Rectangle(int rectLength, int rectWidth, int rectHeight) {
      this(rectLength, rectWidth, rectHeight, new PVector(0, 0, 0));
    } 

  public void toDraw()
  {  
    println("start toDraw");
  
    
    for (int f = 0; f < myFaces.length; f++) {
    beginShape(QUADS);

      if (texturePicture[f]!= null)
      {
        print("process face ");
        println(f);
        int[] myTemp = myFaces[f];
        int[] textureX = new int[] {
          0, 0, 1, 1
        };
        int[] textureY = new int[] {
          0, 1, 1, 0
        };
        
        
        PImage myTexture = loadImage(texturePicture[f]);
        println(texturePicture[f]);
        textureMode(NORMALIZED);
        texture(myTexture);
        for (int i=0; i<4; i++) {
          vertex(myVertices[myTemp[i]].x, myVertices[myTemp[i]].y, myVertices[myTemp[i]].z, textureX[(i+textureOrientation[f])%4], textureY[(i+textureOrientation[f])%4]);
          print(textureX[(i+textureOrientation[f])%4]);
          println(textureY[(i+textureOrientation[f])%4]);
          println(myVertices[myTemp[i]].x);
          println(myVertices[myTemp[i]].y);
          println(myVertices[myTemp[i]].z);
          
        }
        
        println("should color");
        for( int i : myFaces[f]){
           println( myVertices[i].x);
           println( myVertices[i].y);
           println( myVertices[i].z);
        }
        
      }

      else
      {
        print("process face ");
        println(f);
        
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
}

