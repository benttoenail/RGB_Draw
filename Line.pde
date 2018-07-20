class Line {
  PVector pos;
  color c;
  float s;
  float life;
  float speed;

  Line(PVector _pos, color _c, float _s ) {
    c = _c;
    s = _s;
    pos = _pos;
    
    //speed = 2.5;
    life = 0.1;
  }

  void run(float _s) {
    Display();
    Animate(_s);
  }
  
  void Display() {
    float size = SIZE;
    size = size * s;
    
    fill(c, 100);
    ellipse(pos.x, pos.y, size, size);
  }

  void Animate(float _s) {
    speed = _s;
    float x = random(-speed, speed);
    float y = random(-speed, speed);
    pos.x += x;
    pos.y += y;
  }
}
