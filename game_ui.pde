class Button {
  int x, y, w, h;
  String text;
  PFont font;
  Button(int xpos, int ypos, int wid, int hei, String t) {
    x = xpos;
    y = ypos;
    w = wid;
    h = hei;
    text = t;
    font = createFont("微软雅黑", 50, true);
  }
  void show() {
    fill(255);
    noStroke();
    rect(x, y, w, h, 12);
    fill(13, 110, 253);
    textAlign(CENTER);
    textFont(font, 41);
    text(text, x+w/2, y+51);
  }
  boolean isClick() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
}
