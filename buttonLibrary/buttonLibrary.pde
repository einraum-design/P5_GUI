PFont font;

Button b;
ToggleButton t;
ImageButton i;


void setup() {
  size(800, 600);
  frameRate(60);

  b = new Button(20, 20, 300, 40); // x, y, w, h
  t = new ToggleButton(20, 120, 40, 40);
  i = new ImageButton(loadImage("normal.png"), loadImage("aktiv.png"), loadImage("hover.png"), 300, 300);

  font = createFont("Arial", 36);
  textFont(font, 24);
}

void draw() {
  background(255);

  b.render();
  t.render();
  i.render();
  
  if(b.buttonStatus == true){
    println("b clicked");
  } 


  //  fill(0);
  //  text("Hello", 20, 40);

}

void mousePressed() {
}

void mouseReleased() {
  
  b.mouseReleased();
  t.mouseReleased();
  i.mouseReleased();

}

void mouseMoved() {
}

void mouseClicked() {
}

void keyPressed() {
}

void keyReleased() {
}

