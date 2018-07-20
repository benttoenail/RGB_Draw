/* TODO
 GUI
 -Find a better way to hide the buttons 
 
 
 -Figure out "life" issue with line class
 -the "life" variable is not having the effect I want it to...
 
 */
import controlP5.*;

PImage img;
PImage newImg;  

color fillColor;
ArrayList<Line> lines;
public boolean firstSetup = true;
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
      l.run();
    }
  }
}


void FirstSetup()
{
  size(250, 250);
  InitGUI();
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

  //Clear Lines ArrayList
  if (firstSetup == false)
  {
    for (int i = 0; i < lines.size(); i++) {
      lines.remove(i);
    }
  }
  
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
