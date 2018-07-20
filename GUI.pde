ControlP5 cp5;
String imgName;
int imgCount = 0;
Button chooseImg;
Button reset;
Button saveImg;

int col;
float SPEED;
float SIZE;

void InitGUI()
{
  cp5 = new ControlP5(this);

  chooseImg = cp5.addButton("ChooseImage")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(25, 25)
    .setSize(75, 25)
    .setBroadcast(true);

 reset = cp5.addButton("Reset")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(25, 55)
    .setSize(75, 25)
    .setBroadcast(true);

  saveImg = cp5.addButton("SaveImage")
    .setBroadcast(false)
    .setValue(0)  
    .setPosition(25, 85)
    .setSize(75, 25)
    .setBroadcast(true);
    
    cp5.addSlider("SPEED")
    .setPosition(25, 115)
    .setSize(100, 25)
    .setRange(0, 255);
    
    cp5.addSlider("SIZE")
    .setPosition(25, 145)
    .setSize(100, 25)
    .setRange(0, 255);
    
    saveImg = cp5.addButton("Close")
    .setBroadcast(false)
    .setValue(0)  
    .setPosition(25, 175)
    .setSize(75, 25)
    .setBroadcast(true);

    
    col = chooseImg.getColor().getBackground();
}

public void controlEvent(ControlEvent event)
{
  println(event.getController().getName());
  String e = event.getController().getName();
  if (e == "ChooseImage") {
    selectInput("Select an image:", "fileSelected");
  }

  if (e == "Reset") {
    //reset the drawing
    InitGraphics(newImg);
  }

  if (e == "SaveImage") {
    //Save the image
    save(imgName+"-ProcessingEffects_"+imgCount+".png");
    imgCount++;
  }
  
  if(e == "Close"){
   for(int i = 0; i < lines.size(); i++)
   {
    lines.remove(i);
   }
   exit();
  }
}


void setLock(Controller ctrl, boolean v)
{
 ctrl.setLock(v);
 if(v){
  ctrl.setColorBackground(color(0, 0));
 }else{
  ctrl.setColorBackground(color(col)); 
 }
}


void fileSelected(File selection)
{
  if (selection == null) {
    println("No Image was selected");
  } else {

    println("Image Selected: " + selection.getAbsolutePath());
    imgName = selection.getAbsolutePath();
    newImg = loadImage(imgName);
    firstSetup = false;
    setup();
  }
}
