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
    
    speed = 1;
    life = 0.1;
  }

  void run() {
    Display();
    Animate();
  }
  
  void Display() {
    float size = 3;
    size = size * s;
    size -= life;
    fill(c);
    ellipse(pos.x, pos.y, size, size);
  }

  void Animate() {
    float x = random(-speed, speed);
    float y = random(-speed, speed);
    pos.x += x;
    pos.y += y;
  }
}
