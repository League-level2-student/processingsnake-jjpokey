class Segment {

  //2. Create x and y member variables to hold the location of each segment.
int x;
int y;
  // 3. Add a constructor with parameters to initialize each variable.
Segment(int x, int y) {
  this.x = x;
  this.y = y;
}

  // 4. Add getter and setter methods for both the x and y member variables.
 void setX(int x) {
   this.x = x;
 }
 void setY(int y) {
   this.y = y;
 }
  int getX() {
    return x;
}
int getY() {
  return y;
}
}