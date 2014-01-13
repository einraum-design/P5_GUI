class Button {

  float buttonX, buttonY, buttonWidth, buttonHeight = 0;
  int drawMode = CORNER;
  boolean buttonStatus = false;

  color buttonColor = color(120);
  color buttonColorHover = color(180);
  color buttonColorActive = color(230, 100, 100);

  Button() {
    this(0, 0, 200, 40);
  }

  Button(float buttonX, float buttonY, float buttonWidth, float buttonHeight) {
    this.buttonX = buttonX;
    this.buttonY = buttonY;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
  }

  void drawMode(int mode) {
    drawMode = mode;
  }

  void render() {
    if (drawMode == CORNER) {
      rectMode(CORNER);
    }     
    else if (drawMode == CENTER) {
      rectMode(CENTER);
    }

    // hover state
    if (mouseOver()) {
      fill(buttonColorHover);
    } 
    else {
      fill(buttonColor);
    }

    // active state
    if (buttonStatus) {
      fill(buttonColorActive);
      buttonStatus = false;
    }

    rect(buttonX, buttonY, buttonWidth, buttonHeight);
  }


  boolean mouseOver() {
    if (drawMode == CORNER) {
      if (mouseX >= buttonX && mouseX < buttonX + buttonWidth && mouseY >= buttonY && mouseY < buttonY + buttonHeight) {
        //println();
        return true;
      } 
      else {
        return false;
      }
    } 
    else { // if(drawMode == CENTER)
      if (mouseX >= buttonX - buttonWidth/2 && mouseX < buttonX + buttonWidth / 2 && mouseY >= buttonY - buttonHeight/2 && mouseY < buttonY + buttonHeight/2) {
        return true;
      } 
      else {
        return false;
      }
    }
  }

  void mouseReleased() {
    if (mouseOver()) {
      buttonStatus = true;
    }
  }
}

class ToggleButton extends Button {

  ToggleButton() {
    super();
  }

  ToggleButton(float buttonX, float buttonY, float buttonWidth, float buttonHeight) {
    super(buttonX, buttonY, buttonWidth, buttonHeight);
  }

  void render() {

    if (drawMode == CORNER) {
      rectMode(CORNER);
    }     
    else if (drawMode == CENTER) {
      rectMode(CENTER);
    }

    // hover state
    if (mouseOver()) {
      fill(buttonColorHover);
    } 
    else {
      fill(buttonColor);
    }

    // active state
    if (buttonStatus) {
      fill(buttonColorActive);
    }

    rect(buttonX, buttonY, buttonWidth, buttonHeight);
  }

  void mouseReleased() {
    if (mouseOver()) {
      buttonStatus = !buttonStatus;
    }
  }
}

class ImageButton extends Button{
  PImage buttonImage = null;
  PImage buttonImageHover = null;
  PImage buttonImageActive = null;


  ImageButton() {
    // no Image!
    super();
  }

  ImageButton(PImage buttonImage) {
    super(0.0, 0.0, (float)buttonImage.width, (float)buttonImage.height);
    this.buttonImage = buttonImage;
  }

  ImageButton(PImage buttonImage, float buttonX, float buttonY) {
    super(buttonX, buttonY, buttonImage.width, buttonImage.height);
    this.buttonImage = buttonImage;
  }

  ImageButton(PImage buttonImage, PImage buttonImageActive, float buttonX, float buttonY) {
    super(buttonX, buttonY, buttonImage.width, buttonImage.height);
    this.buttonImage = buttonImage;
    this.buttonImageActive = buttonImageActive;
  }
  
  ImageButton(PImage buttonImage, PImage buttonImageActive, PImage buttonImageHover, float buttonX, float buttonY) {
    super(buttonX, buttonY, buttonImage.width, buttonImage.height);
    this.buttonImage = buttonImage;
    this.buttonImageActive = buttonImageActive;
    this.buttonImageHover = buttonImageHover;
  }

  void render() {
    if (drawMode == CORNER) {
      imageMode(CORNER);
    }     
    else if (drawMode == CENTER) {
      imageMode(CENTER);
    }

    // hover state
    if (mouseOver()) {
      if (buttonImageHover != null) {
        image(buttonImageHover, buttonX, buttonY);
      }
      else {
        image(buttonImage, buttonX, buttonY);
      }
    } 
    else {
      image(buttonImage, buttonX, buttonY);
    }

    // active state
    if (buttonStatus) {
      if (buttonImageActive != null) {
        image(buttonImageActive, buttonX, buttonY);
        buttonStatus = false;
      }
    }
  }
}

// Slider Class
class Slider {
  int drawMode = CORNER;

  float sliderX;
  float sliderY;
  float sliderW;
  float sliderH;

  color sliderBackgroundColor = color(200, 200, 200);
  color sliderMarkerColor = color(100, 100, 155);

  float sliderValue = 0;

  Slider(float sliderX, float sliderY, float sliderW, float sliderH) {
    this.sliderX = sliderX;
    this.sliderY = sliderY;
    this.sliderW = sliderW;
    this.sliderH = sliderH;
  }

  void render() {
    
    if(mousePressed && mouseOver()){
      sliderValue = map(mouseX, sliderX, sliderX + sliderW, 0, 1);
    }
    
    
    if (drawMode == CORNER) {
      rectMode(CORNER);
      fill(sliderBackgroundColor);
      rect(sliderX, sliderY, sliderW, sliderH);

      float markerW = 6;
      fill(sliderMarkerColor);
      rect(sliderX + sliderValue * sliderW - markerW/2, sliderY-2, markerW, sliderH + 4);
    }
  }
  
  boolean mouseOver() {
    if (drawMode == CORNER) {
      if (mouseX >= sliderX && mouseX < sliderX + sliderW && mouseY >= sliderY && mouseY < sliderY + sliderH) {
        //println();
        return true;
      } 
      else {
        return false;
      }
    } 
    else { // if(drawMode == CENTER)
      if (mouseX >= sliderX - sliderW/2 && mouseX < sliderX + sliderW / 2 && mouseY >= sliderY - sliderH/2 && mouseY < sliderY + sliderH/2) {
        return true;
      } 
      else {
        return false;
      }
    }
  }
}
