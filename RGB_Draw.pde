
/* TODO
-Add GUI that allows user to: 
  -save images
  -Clear Screen
-Figure out "life" issue with line class
  -the "life" variable is not having the effect I want it to...

*/

PImage img;
color fillColor;
ArrayList<Line> lines;

void setup()
{
  img = loadImage("Circles-Test.jpg");
  image(img, 0, 0);
  
  //Setting size of canvas to equal that of image
  size(200, 200);
  surface.setResizable(true);
  int imgX = img.width;
  int imgY = img.height;
  surface.setSize(imgX, imgY);
  
  smooth();
  noStroke();
  background(0);
  fillColor = color(255, 0, 0);

  lines = new ArrayList<Line>();

  //Initialize and draw points
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color c = img.get(int(x), int(y));
      float r = red(c);    //use red channel to find B&W value
      if (r > 0.1) {
        PVector pos = new PVector(x, y);
        float s = norm(r, 0, 255);
        lines.add(new Line(pos, fillColor, s));
      }
    }
  }
}


void draw()
{
  for (Line l : lines) {
    l.run();
  }
}
