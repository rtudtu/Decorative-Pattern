/*************************************************************************
* Assignment 03: Decorative Pattern  //  Date: January 15, 2018
* ARTG 2260: Programming Basics      // Instructor: Jose
* Written By: Richard Tu             // Email: tu.r@husky.neu.edu
* Title: 3D Rainbow Rhombi Gradient 
* Description: Cool Design with rainbow gradient that moves!
               Can generate "programmitically". Size of rhombi will
               be different based on height (not width). Amount of rhombi
               will increase to fit height/width. Color changing speed
               can be modified by the colorSpeed variable.
*************************************************************************/

int countShapeHorizontal = 9;    //countX
int countShapeVertical   = 20;   //countY
float m = 2.5;                   //magnifier (Dependent on height)
boolean backslash = true;        //Create backslash or forward slash shapes
float red = 0;                   //Red RGB
float green = 0;                 //Green RGB
float blue = 0;                  //Blue RGB
int colorSpeed = 15;             //Speed at which color changes
boolean colorUp = true;          //Color direction - towards red or blue
int colorCount = 0;              //Color value - towards red or blue

void setup() {
  size(1024, 1024);              //Size of screen
  m = height / 409.6;            //Magnify shape size depending on height
  countShapeHorizontal = width / int(50.0 * m) + 3;    //Number of shapes in the x direction to fit screen
  countShapeVertical = height / int(20.0 * m) + 3;     //Number of shapes in the y direction to fit screen
  //For testing:
  //println("Horiz: " + countShapeHorizontal);
  //println("Verti: " + countShapeVertical);
  //println("colorStep: " + colorStep);
  //print(m);
  background(222, 222, 222);     //Set initial background to light gray
  //For screenshots
  //noLoop();
}


void draw() {
  //If colorCount exceeds 200 or -175, set it in the other direction
  if(colorUp) {
    colorCount += colorSpeed;
  } else {
    colorCount -= colorSpeed;
  }
  if(colorCount > 200) {
    colorUp = false;
  } else if(colorCount < -175) {
    colorUp = true;
  }

  //Draw countShapeHorizontal rhombi horizontally countShapeVertical times
  for(int y = -30; y < (countShapeVertical * 20) - 30; y += 20) {
    for(int x = -75; x < (countShapeHorizontal * 50) - 75; x += 50) {
      //For rolling rainbow gradient
      red = (255/countShapeVertical) * (y/20) + colorCount;
      blue = (255/countShapeHorizontal) * (x/50) - colorCount;
      green = ((255/countShapeVertical) * (y/20) + colorCount) + ((255/countShapeHorizontal) * (x/50) - colorCount);
      //For flashing color:
      //if (red > 255) {
      //  redUp = false;
      //} else if (red < 0) {
      //  redUp = true;
      //}
      //if(redUp) {
      //  red += colorSpeed;
      //} else {
      //  red -= colorSpeed;
      //}
      //For rolling color:
      //if (red > 255) {
      //  red = 0;
      //} else {
      //  red += colorSpeed;
      //}
      //For random colors:
      //red = random(111, 255);
      //green = random(111, 255);
      //blue = random(111, 255);
      if(backslash) {
        //draw backslash figure (rhombus)
        //draw top rhombi (colored)
        fill(red, green, blue);
        beginShape();
          vertex((x + 10) * m, (y + 10) * m);
          vertex((x + 50) * m, (y + 25) * m);
          vertex((x + 40) * m, (y + 30) * m);
          vertex((x + 0) * m, (y + 15) * m);
        endShape(CLOSE);
        //draw black side
        fill(0);
        beginShape();
          vertex((x + 50) * m, (y + 25) * m);
          vertex((x + 50) * m, (y + 195) * m);
          vertex((x + 40) * m, (y + 200) * m);
          vertex((x + 40) * m, (y + 30) * m);
        endShape(CLOSE);
        //draw gray side
        fill(125);
        beginShape();
          vertex((x + 0) * m, (y + 15) * m);
          vertex((x + 40) * m, (y + 30) * m);
          vertex((x + 40) * m, (y + 200) * m);
          vertex((x + 0) * m, (y + 185) * m);
        endShape(CLOSE);
        } else {
        //draw forward slash figure (rhombus)
        //draw top rhombi (colored)
        fill(red, green, blue);
        beginShape();
          vertex((x + 10) * m, (y + 10) * m);
          vertex((x + 20) * m, (y + 15) * m);
          vertex((x + -20) * m, (y + 30) * m);
          vertex((x + -30) * m, (y + 25) * m);
        endShape(CLOSE);
        //draw black side
        fill(0);
        beginShape();
          vertex((x + 20) * m, (y + 15) * m);
          vertex((x + 20) * m, (y + 185) * m);
          vertex((x + -20) * m, (y + 200) * m);
          vertex((x + -20) * m, (y + 30) * m);
        endShape(CLOSE);
        //draw gray side
        fill(125);
        beginShape();
          vertex((x + -30) * m, (y + 25) * m);
          vertex((x + -20) * m, (y + 30) * m);
          vertex((x + -20) * m, (y + 200) * m);
          vertex((x + -30) * m, (y + 195) * m);
        endShape(CLOSE);
        }
    }
    //Once we draw backslash, draw forwardslash etc.
    if(backslash) {
      backslash = false;
    } else if(!backslash) {
      backslash = true;
    }
  }
  //End with what we started with - backslash = true;
  backslash =true;
  //For saving frame:
  //saveFrame("More-Red");
}