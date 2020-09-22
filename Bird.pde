
int angle=0;
int snakesize=5;
int time=0;
int[] headx= new int[2500];
int[] heady= new int[2500];
int  applex=(round(random(31))+1)*10;
int  appley=(round(random(40))+1)*10;
boolean redo=true;
boolean stopgame=false;

  void Move() {
    
     if (stopgame)
  {
    //do nothing because of game over (stop playing)
  }
  else
  {
     //draw stationary stuff
  time+=1;

 // fill(255,0,0);
 // ellipse(applex,appley,5,5);
           ShineOn(LEDNum, applex, appley, 0, true); //The apple

     if ((time % 5)==0)
  {
   
    LEDdisplay();
    travel();
    checkdead();
  }
  }
 
    
    // check border condition
  }

void travel()
{
  for(int i=snakesize;i>0;i--)
  {
    if (i!=1)
    {
      //shift all the coordinates back one array
      headx[i]=headx[i-1];
      heady[i]=heady[i-1];
    }
    else
    {
      //move the new spot for the head of the snake, which is
      //always at headx[1] and heady[1].
      switch(angle)
      {
        case 0:
        headx[1]+=10;
        break;
        case 90:
        heady[1]-=10;
        break;
        case 180:
        headx[1]-=10;
        break;
        case 270:
        heady[1]+=10;
        break;
      }
    }
  }
  
}
void LEDdisplay()
{
  //is the head of the snake eating the apple?
  if (headx[1]==applex && heady[1]==appley)
  {
    //grow and spawn the apple somewhere away from the snake
    //(currently some of the code below might not be working, but the game still works.)
    snakesize+=round(random(3)+1);
    redo=true;
    while(redo)
    {
      applex=(round(random(31))+1)*10;
      appley=(round(random(40))+1)*10;
      for(int i=1;i<snakesize;i++)
      {
        
        if (applex==headx[i] && appley==heady[i])
        {
          redo=true;
        }
        else
        {
          redo=false;
          i=1000;
        }
      }
    }
  }
  //draw the new head of the snake...
 // noStroke();
 // fill(sinecolor(1),sinecolor(0),sinecolor(.5));
 // rect(headx[1],heady[1],8,8);
  //...then erase the back end of the snake.
 // fill(255);
 // rect(headx[snakesize],heady[snakesize],8,8);
 // println("Headx: " +  headx[1]);
 
  
         ShineOn(LEDNum, headx[1], heady[1], 255, false); //The head of the snake
         ShineOn(LEDNum, headx[snakesize], heady[snakesize], 0, false); //The tail of the snake

    // You wont need to insert the exact position for arduino, just have the right ID
   

}

void checkdead()
{
  for(int i=2;i<=snakesize;i++)
  {
    //is the head of the snake occupying the same spot as any of the snake chunks?
    if (headx[1]==headx[i] && heady[1]==heady[i])
    {
      stopgame=true;
    }
    //is the head of the snake hitting the walls?
    if (headx[1]>=width)
    {
      headx[1] = 0;
    }
    if(heady[1]>=height)
    {
      heady[1]= 0;
    }
    if(headx[1]<0)
    {
      headx[1] = width-10;
    }
    if(heady[1]< 0)
    {
      heady[1]= height - 10;
    }
    
    
    /// Old wall block code
  //    fill(255);
  //    rect(125,125,160,100);
  //    fill(0);
  //    text("GAME OVER",200,150);
  //    text("Score:  "+str(snakesize-1)+" units long",200,175);
  //    text("To restart, press Shift.",200,200);
  //    stopgame=true;
    
  }
}
void restart()
{
  //by pressing shift, all of the main variables reset to their defaults.
  background(0);
  headx[1]=200;
  heady[1]=200;
  for (int x=0; x < LEDsArray.length; x++) {
    for(int y = 0; y < LEDsArray[x]; y++){
    fill(255, 255, 255);
    ellipse(x * 10 + 10, height - 10 - (y*10), 5, 5);
    }
  }
   for (int i=0; i<maxLEDs; i++) {
  brightness[i] =0;
  }
  
  for(int i=2;i<1000;i++)
  {
    headx[i]=0;
    heady[i]=0;
  }
  stopgame=false;
  applex=(round(random(31))+1)*10;
  appley=(round(random(40))+1)*10;
  snakesize=5;
  time=0;
  angle=0;
  redo=true;
}
int sinecolor(float percent)
{
  int slime=int((sin(radians((((time +(255*percent)) % 255)/255)*360)))*255);
  return slime;
}