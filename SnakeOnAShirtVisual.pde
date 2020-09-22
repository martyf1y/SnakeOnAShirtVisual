// Script by Matt, June 2015

// First tasks
// Set an array of 31 strips with length of Stip
// Set 31 objects as strips
// Set each strip to have a declared amount of LEDS
// Each strip object has an LED object
// Each LED has an ID 

//// OR
// Set a 2D array
// Find where the Lights want to go
// Create an object with the info of the light,
// Delete object after it has been used


//int birdNum = 1;
//ArrayList Birds;

int maxLEDs = 1056;
int [] brightness = new int [maxLEDs];
int [] stripNumArr = new int [maxLEDs];
int [] rowNumArr = new int [maxLEDs];
int[] LEDsArray = {24,25,26,27,38,40,40,40,40,37,36,35,35,34,34,34,34,34,35,35,36,37,40,40,40,40,38,27,26,25,24};

int stripNum; // This is which strip the LED is on
int rowNum; //This is how far up the LED is
int LEDNum; // This is the LED ID

void setup()
{
  size(320, 410);
    
//  for (int i=0; i<maxLEDs; i++) {
  //  SignalShine = new Signal(i);
  //  LED.add(SignalShine);
 // }
 //   Birds = new ArrayList();
//  for (int i=0; i<birdNum; i++) {
 //   Birds.add(Birdy);
//  }
  
  background(0);
//// The basic grid
  for (int x=0; x < LEDsArray.length; x++) {
    for(int y = 0; y < LEDsArray[x]; y++){
    fill(255, 255, 255);
    ellipse(x * 10 + 10, height - 10 - (y*10), 5, 5);
    }
  }
}

void draw()
{
 
  

//  for (int i=0; i<birdNum; i++) {
    //Birdy = ( BirdObject ) Birds.get(i);
     Move();
    
  //}

 // ALWAYS PUT SHOW AT THE BOTTOM !!!!!!!!!!!!!!!!!!!!!!
}

  void ShineOn(int ID, int posx, int posY, int bright, boolean apple){
    stripNum = (int)(map(posx, 0, width, 0, 31));
     rowNum = (int)(map(posY, 0, height, 0, 40));
     LEDNum = 0;
 for(int n = 0; n < stripNum; n++){
    LEDNum += LEDsArray[n];
  }
   LEDNum += rowNum;
   if(rowNum < LEDsArray[stripNum]){
    brightness[LEDNum] = bright;
    stripNumArr[LEDNum] = stripNum;
    rowNumArr[LEDNum] = rowNum;    
    // You wont need to insert the exact position for arduino, just have the right ID
  
   ///// Make sure to get LED brightness before we go any further!
  int r ;
  int b ;
  int g ;
  if(apple){
   r = 255;
   g = 0;
   b = 0;
  }
  else if(brightness[LEDNum] > 0){
   r = sinecolor(0.5);
   b = sinecolor(0.5);
   g = sinecolor(1);
  }
  else {
    r = 255;
    g = 255;
    b = 255;
  }
  // This would just be the ID number
  fill(r,g,b, 255);
  ellipse(stripNum * 10 + 10, height - 10 - (rowNum*10),5,5);
 }
  else if(apple)
  {
    applex=(round(random(31))+1)*10;
      appley=(round(random(40))+1)*10;
  } 
  
  LEDNum = 0;
  }
  

//controls:
void keyPressed()
{
  if (key == CODED)
  {
    //what key was pressed? is the previous angle the opposite direction?
    //we wouldn't want to go backwards into our body, that would hurt!
    //also, is the previous body segment in front of the direction? 
    //(based on the previous question, but added for secure turning without suicide)
    if (keyCode == DOWN && angle!=270 && (heady[1]-10)!=heady[2])
    {
      angle=90;
    }
    if (keyCode == UP && angle!=90 && (heady[1]+10)!=heady[2])
    {
      angle=270;
    }if (keyCode == LEFT && angle!=0 && (headx[1]-8)!=headx[2])
    {
      angle=180;
    }if (keyCode == RIGHT && angle!=180 && (headx[1]+10)!=headx[2])
    {
      angle=0;
    }
    if (keyCode == SHIFT)
    {
      //restart the game by pressing shift
      restart();
    }
     if (key==' ') setup();
  }
}