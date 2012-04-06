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

  PVector[] myTransformedVertices= null;







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

      scale();

    }



    public Rectangle(int rectLength, int rectWidth, int rectHeight) {

      this(rectLength, rectWidth, rectHeight, new PVector(0, 0, 0));

    } 



  public void toDraw()

  {  

    //println("start toDraw");

    myTransformedVertices = applyTransformations(myVertices);

  

    

    for (int f = 0; f < myFaces.length; f++) {

    beginShape(QUADS);



      if (texturePicture[f]!= null)

      {

        //print("process face ");

        //println(f);

        int[] myTemp = myFaces[f];

        int[] textureX = new int[] {

          0, 0, 1, 1

        };

        int[] textureY = new int[] {

          0, 1, 1, 0

        };

        

        

        PImage myTexture = loadImage(texturePicture[f]);

        //println(texturePicture[f]);

        textureMode(NORMALIZED);

        texture(myTexture);

        for (int i=0; i<4; i++) {

          vertex(myTransformedVertices[myTemp[i]].x, myTransformedVertices[myTemp[i]].y, myTransformedVertices[myTemp[i]].z, textureX[(i+textureOrientation[f])%4], textureY[(i+textureOrientation[f])%4]);

          //print(textureX[(i+textureOrientation[f])%4]);

          //println(textureY[(i+textureOrientation[f])%4]);

          //println(myTransformedVertices[myTemp[i]].x);

          //println(myTransformedVertices[myTemp[i]].y);

          //println(myTransformedVertices[myTemp[i]].z);

          

        }

        

        //println("should color");

        for( int i : myFaces[f]){

           //println( myTransformedVertices[i].x);

           //println( myTransformedVertices[i].y);

           //println( myTransformedVertices[i].z);

        }

        

      }



      else

      {

        //print("process face ");

        //println(f);

        

        for (int i : myFaces[f])

        {

          vertex(myTransformedVertices[i].x, myTransformedVertices[i].y, myTransformedVertices[i].z);

        }

      }

      endShape();

    }

    

    

  }



  public void setTexture( int face, String fileName, int rotation) {

    texturePicture[face] = fileName;

    textureOrientation[face] = rotation;

  }



  public void addTranslate(PVector translation) {

    translateAmount = translation.get();

  };



  public void addRotateX(float radian) {

    rotationAmount.set(radian, rotationAmount.y, rotationAmount.z);

  };



  public void addRotateY(float radian) {

    rotationAmount.set(rotationAmount.x, radian, rotationAmount.z);

  };



  public void addRotateZ(float radian) {

    rotationAmount.set(rotationAmount.x, rotationAmount.y, radian);

  };



  public void resetTranslation() {

    translateAmount = new PVector();

  }



  public void resetRotation() {

    rotationAmount = new PVector();

  }

  

  private void scale(){

    for(int i=0; i<myVertices.length; i++){

      myVertices[i]=new PVector( myVertices[i].x*myLength, myVertices[i].y*myWidth, myVertices[i].z*myHeight);

    }

  

  }  



  private PVector[] applyTransformations(PVector[] input) {

    PVector[] clonedInput = new PVector[input.length];

    for(int i=0; i<input.length; i++){

      clonedInput[i]=input[i].get(); 

    }

    return applyTranslations(applyZRotation(applyYRotation(applyXRotation(clonedInput))));

  }



  private PVector[] applyTranslations(PVector[] input) {

    for ( int i=0; i<input.length; i++) {

      input[i].add( translateAmount);

    } 

    return input;

  }



  private PVector[] applyXRotation(PVector[] input) {

    for ( int i=0; i<input.length; i++) {

      input[i] = new PVector( input[i].x, input[i].y * sin(rotationAmount.x) + input[i].z*cos(rotationAmount.x), input[i].y*cos(rotationAmount.x)-input[i].z*sin(rotationAmount.x));

    }

    return input;

  }

  

  private PVector[] applyYRotation(PVector[] input) {

    for ( int i=0; i<input.length; i++) {

      input[i] = new PVector( input[i].z * sin(rotationAmount.y) + input[i].x*cos(rotationAmount.y), input[i].y , input[i].z*cos(rotationAmount.y)-input[i].x*sin(rotationAmount.y));

    }

    return input;

  }

  

  private PVector[] applyZRotation(PVector[] input) {

    for ( int i=0; i<input.length; i++) {

      input[i] = new PVector( input[i].x*cos(rotationAmount.z)-input[i].y*sin(rotationAmount.z), input[i].x * sin(rotationAmount.z) + input[i].y*cos(rotationAmount.z), input[i].z);

    }

    return input;

  }



  public void removeTexture( int face) {

    texturePicture[face] = null;

    textureOrientation[face] = -1;

  }

}


