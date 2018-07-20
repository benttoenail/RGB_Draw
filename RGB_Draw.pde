/* TODO
 GUI
 -Find a better way to hide the buttons 
 
 -Issue
 -Every other time the program freezes
 
 Lines
 -Figure out "life" issue with line class
 -the "life" variable is not having the effect I want it to...
 
 */
import controlP5.*;

PImage img;
PImage newImg;  

color fillColor;
ArrayList<Line> lines;
boolean firstSetup = true;
public boolean draw = false;

void setup()
{
  smooth();
  noStroke();
  background(0);


  if (firstSetup == true) {
    img = loadImage("Circles-Test.jpg");
    image(img, 0, 0);
    InitGraphics(img);
  } else {
    //img equals new selected image 
    println("new Image selected");
    img = newImg;
    InitGraphics(img);
  }
}


void draw()
{
  if (!firstSetup) {
    for (Line l : lines) {
      l.run(SPEED);
    }
  }
}

void InitGraphics(PImage _img)
{
  background(0);
  lines = new ArrayList<Line>();
  fillColor = color(255, 0, 0);

  InitGUI(); // INITIALIZE GUI

  //Setting size of canvas to equal that of image
  surface.setResizable(true);
  int imgX = _img.width;
  int imgY = _img.height;
  surface.setSize(imgX, imgY);

  DrawGraphics(_img);
}


public void DrawGraphics(PImage _img)
{
  //Initialize and draw pointsbackground(0,0);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color c = _img.get(int(x), int(y));
      float r = red(c);    //use red channel to find B&W value
      if (r > 0.1) {
        PVector pos = new PVector(x, y);
        float s = norm(r, 0, 255);
        lines.add(new Line(pos, fillColor, s));
      }
    }
  }
}
