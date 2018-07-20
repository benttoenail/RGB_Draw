ControlP5 cp5;
String imgName;
int imgCount = 0;
Button chooseImg;
Button reset;
Button saveImg;

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

    chooseImg.hide();
    reset.hide();
    saveImg.hide();
    background(0);
    save(imgName+"-ProcessingEffects_"+imgCount+".png");
    imgCount++;
    /*
    chooseImg.show();
    reset.show();
    saveImg.show();
    */
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
