import processing.sound.*;

Amplitude amp;
AudioIn in;

PImage[] images;
String[] imageNames = {
  "F", "L1", "F", "L2", "F", "L3", "F", "Lsima", "Ffel", "Lsima", "Ffel", "Lgrat", "Fgrat", "Lgrat", "Fgrat"}; // Képek nevei
int currentImageIndex = 0; 

void setup() {
  size(500, 650);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  images = new PImage[imageNames.length];
  for (int i = 0; i < imageNames.length; i++) {
    images[i] = loadImage(imageNames[i] + ".jpg");
  }
}

void draw() {
  background(0);
  
  
  image(images[currentImageIndex], 0, 0, width, height);
  
  float audioLevel = amp.analyze();
  if (audioLevel > 0.2) { //határérték
    currentImageIndex = (currentImageIndex + 1) % images.length;
    delay(300);
  }
}
