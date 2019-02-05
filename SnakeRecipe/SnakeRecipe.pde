
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.



// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment s;


// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String direction = "up";


// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int FoodEated = 1;


// 8. Create and initialize foodX and foodY variables to hold the location of the food.

// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);


void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500,500);


  // 10. initialize your head to a new segment.
s = new Segment(50,50);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(15);
}


void draw() {

  background(0,0,0);


  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  fill(255,255,255);
  rect(foodX,foodY,10,10);
  
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
fill(#00FF00);
rect(s.getX(),s.getY(),10,10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  
  switch(direction) {
  case "up":
    s.y = s.y - 10;
    break;
  case "down":
    s.y = s.y + 10;
    break;
  case "left":
   s.x = s.x - 10; 
    break;
  case "right":
    s.x = s.x + 10; 
    break;
  }
  


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if(keyCode == UP && !direction.equals("down")) {
    direction = "up";
  }
  if(keyCode == DOWN && !direction.equals("up")) {
    direction = "down";
  }
  if(keyCode == LEFT) {
    direction = "left";
  }
  if(keyCode == RIGHT) {
    direction = "right";
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(s.x > 500) {
    s.x = 0;
  }
  if(s.x < 0) {
    s.x = 500;
  }
  if(s.y > 500) {
    s.y = 0;
  }
  if(s.y < 0) {
    s.y = 500;
  }
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {

  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
     if(s.getX() == foodX && s.getY() == foodY) {
     FoodEated += 1;
     
 foodX = ((int)random(50)*10);
 foodY = ((int)random(50)*10);
     }
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList <Segment> SegList = new ArrayList <Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
drawTail();
checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  Segment s2 = new Segment(s.x,s.y);
SegList.add(s2);
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  while(SegList.size() > FoodEated) {
SegList.remove(0);
  }
}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for(Segment Seg : SegList) {
      rect(Seg.x,Seg.y,10,10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  for(Segment Seg : SegList) {
if(s.getX() == Seg.x && s.getY() == Seg.y) {
  

  
  // reset your food variable
FoodEated = 1;
  //Call this method at the beginning of your manageTail method.
  
}
  }
}