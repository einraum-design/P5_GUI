PFont font;

Button button;
ImageButton imageButton;
LabelButton labelButton1;
LabelButton labelButton2;
LabelButton labelButton3;

ToggleButton toggleButton;
ImageToggleButton imageToggleButton;
LabelToggleButton labelToggleButton;

Slider slider;

void setup() {
  size(800, 600);
  frameRate(60);

  font = createFont("Arial", 18);
  textFont(font, 18);

  // Standart Button
  button = new Button(20, 20, 130, 30); // x, y, w, h
  
  // mit TextLabel
  labelButton1 = new LabelButton("Button1", 400, 20, 160, 22);
  labelButton2 = new LabelButton("Button2", 400, 60, 160, 22);
  // zeichen von der Mitte:
  labelButton2.drawMode = CENTER;
  labelButton3 = new LabelButton("Button3", 400, 100, 160, 22);
  // Label linksbündig
  labelButton3.textAlign = RIGHT;
  
  // Bild Button
  imageButton = new ImageButton(loadImage("normal.png"), loadImage("aktiv.png"), loadImage("hover.png"), 300, 300);


  // Toggle Button - Zustand umschalten an - aus
  toggleButton = new ToggleButton(20, 120, 40, 40);
  labelToggleButton = new LabelToggleButton("ButtonToggle", 400, 400, 140, 30);
  imageToggleButton = new ImageToggleButton(loadImage("normal.png"), loadImage("aktiv.png"), loadImage("hover.png"), 400, 300);

  // Slider
  slider = new Slider(50, 500, 700, 30);// (float sliderX, float sliderY, float sliderW, float sliderH) {
}

void draw() {
  background(255);



  // über die eigenschaft buttonName.buttonStatus könnt ihr abfragen, 
  // ob der button an oder aus ist. funktioniert bei allen Button Typen

  // check ob einfacher Button gerade gedrückt ist
  if (button.buttonStatus == true) {
    println("button clicked");
  } 
  
  

  // am Ende der draw Buttons zeichnen
  button.render();
  labelButton1.render();
  labelButton2.render();
  labelButton3.render();
  imageButton.render();

  toggleButton.render();
  labelToggleButton.render();
  imageToggleButton.render();

  // slider.getValue gibt sliderValue 0 - 1 zurück
  text("sliderValue: " + slider.getValue(), slider.sliderX, slider.sliderY + 60);
  slider.render();
}

void mousePressed() {
  
  // allen Buttons das mousePressed Event mitgehben (nur wenn im moment auch gezeichnet)
  button.mousePressed();
  labelButton1.mousePressed();
  labelButton2.mousePressed();
  labelButton3.mousePressed();
  imageButton.mousePressed();

  toggleButton.mousePressed();
  labelToggleButton.mousePressed();
  imageToggleButton.mousePressed();
}

void mouseReleased() {
  // allen Buttons das mouseReleased Event mitgehben (nur wenn im moment auch gezeichnet)
  button.mouseReleased();
  labelButton1.mouseReleased();
  labelButton2.mouseReleased();
  labelButton3.mouseReleased();
  imageButton.mouseReleased();

  toggleButton.mouseReleased();
  labelToggleButton.mouseReleased();
  imageToggleButton.mouseReleased();
}

void mouseMoved() {
}

void mouseClicked() {
}

void keyPressed() {
}

void keyReleased() {
}

