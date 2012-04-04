public class myCards
{
  int cardLength=88;
  int cardWidth=56;
  int cardHeight=5;
  String cardImages = "./data/cards.png";
  
  int mySuit;
  int myValue;
  
  public myCards(int suit, int value){
    mySuit = suit;
    myValue = value;
  }
  
  
  
  public void createCard()
  {
      final int[][] myFaces = {
          { 1, 3, 6, 5 },
          { 0, 2, 7, 4 },
          { 0, 2, 3, 1 },
          { 7, 6, 5, 4 },
          { 0, 1, 5, 4 },
          { 2, 3, 6, 7 } //cardface
          
      };
      final PVector[] myVertices = {
          new PVector( 0          ,  cardLength,  0         ),
          new PVector( cardWidth  ,  cardLength,  0         ),
          new PVector( 0          ,  cardLength,  cardHeight),
          new PVector( cardWidth  ,  cardLength,  cardHeight),
          new PVector( 0          ,  0         ,  0         ),
          new PVector( cardWidth  ,  0         ,  0         ),
          new PVector( cardWidth  ,  0         ,  cardHeight),
          new PVector( 0          ,  0         ,  cardHeight) 
      };
//      PImage a = loadImage("skyImage.jpeg");
//      texture(a);
          beginShape(QUADS);
          for (int f = 0; f < myFaces.length; f++)
          {
              if(f==5){
                PImage cardImage = loadImage(cardImages);
                textureMode(NORMALIZED);
                texture(cardImage);
                
                float cardLengthPixels = 1.0/4;
                float cardWidthPixels = 1.0/13;
                
                int[] verteces = myFaces[f];
                 vertex(myVertices[verteces[0]].x, myVertices[verteces[0]].y, myVertices[verteces[0]].z, (myValue)*cardWidthPixels, (mySuit-1)*cardLengthPixels);
                 vertex(myVertices[verteces[1]].x, myVertices[verteces[1]].y, myVertices[verteces[1]].z, (myValue-1)*cardWidthPixels, (mySuit-1)*cardLengthPixels);
                 vertex(myVertices[verteces[2]].x, myVertices[verteces[2]].y, myVertices[verteces[2]].z, (myValue-1)*cardWidthPixels, (mySuit)*cardLengthPixels);
                 vertex(myVertices[verteces[3]].x, myVertices[verteces[3]].y, myVertices[verteces[3]].z, (myValue)*cardWidthPixels, (mySuit)*cardLengthPixels);
                 
                 println("vertices");
                 println(  (myValue-1)*cardWidthPixels);
                 println( (mySuit-1)*cardLengthPixels);                 
                 println(  (myValue)*cardWidthPixels);
                 println( (mySuit)*cardLengthPixels);
              }
              else{
                for (int i : myFaces[f])
                {
                    print("processing face ");
                    println(f);
                    vertex(myVertices[i].x, myVertices[i].y, myVertices[i].z);
                }
              }
          }
          endShape();
        } 
}
