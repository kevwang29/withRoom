public class Card {
  Rectangle1 myCard = new Rectangle1(6.35,0.2,9.0);
  boolean beingDealt = false;
  boolean flipped = false;
  float timeLastUpdated = 0;
  float myTableHeight = 0;
  PVector myLocation;
  PVector mySpeed;
  float resistance = 5;
  boolean hitDeck= false;
  boolean debug = false;
  
  public Card(PVector location){
     myLocation = location;    
  }
  
  public void toDraw(float t){
    pushMatrix();
    if(beingDealt){
        updateLocation(t);
    }
    
    if(flipped){ 
      rotateX(PI);
    }
    
    renderCard(t);
    popMatrix();
    
  }
  
  public void renderCard(float t){
    pushMatrix();
    translate(myLocation.x, myLocation.y, myLocation.z);
    myCard.setTexture(3, "./data/cards/clubs-2-150.jpg", 1);
    myCard.setTexture(2, "./data/cards/back-blue-150-1.jpg", 1);
    myCard.toDraw();
    popMatrix();
  }
  
  public void toDealCard(float t, float tableHeight, PVector velocity){
      beingDealt = true;
      timeLastUpdated = t;
      mySpeed = velocity.get();
      myTableHeight = tableHeight;
  }
  
  private void updateLocation(float t){
    if(debug){
     println("speed before update");
     println(mySpeed);
     print( "input time");
     println(t);
     print("last update");
     println( timeLastUpdated);
     
    }
    float timeElapsed = t - timeLastUpdated;
    
    if( myLocation.y>myTableHeight) {
      if(debug) println("hitdeck");
      hitDeck = true;
      mySpeed = new PVector(mySpeed.x, 0 , mySpeed.z);
      myLocation = new PVector(myLocation.x, myTableHeight, myLocation.z);
    }
    
    PVector horizontalSpeed = new PVector( mySpeed.x, 0, mySpeed.z);
    PVector verticalSpeed = new PVector( 0, mySpeed.y, 0);
    
    if(hitDeck){
        horizontalSpeed.sub(PVector.mult(horizontalSpeed,(timeElapsed)/1000*resistance));
        if(horizontalSpeed.mag()<0.01) {
          stopAnimation();
          horizontalSpeed = new PVector();
        }
        
    }
    else{
        verticalSpeed.add( new PVector(0, (timeElapsed)/1000*5, 0));
    }
    myLocation.add(PVector.mult(horizontalSpeed,(timeElapsed/1000)));
    myLocation.add(PVector.mult(verticalSpeed,(timeElapsed/1000)));
    
    mySpeed = PVector.add(horizontalSpeed,verticalSpeed);
    timeLastUpdated = t;
    if(debug){
      print("mylocation");
      println(myLocation);
      print("my speed");
      println(mySpeed);
      print("time elapsed");
      println(timeElapsed);
      println();
    }

    
      
  }
  
  private void stopAnimation(){
    if(debug){
      println("animation stopped");
    }
    mySpeed = new PVector();
    myTableHeight=0;
    beingDealt = false;
    hitDeck = false;
  }
}
