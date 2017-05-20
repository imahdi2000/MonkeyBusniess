Player player;
Nexus nexus;
ArrayList<Bullet> bullets;
/*
 Shop shop;
 ArrayList<Enemy> queuedEnemies;
 ArrayList<Enemy> spawnedEnemies;
 ArrayList<Turret> turrets;
 ArrayList<Trap> traps;
 ArrayList<Gold> gold;
 */
int waveInterval;
boolean gameOver;
int highscore;
boolean[] keys = new boolean[128];

void setup() {
  // Canvas size
  size(1200, 720);
  player = new Player();
  nexus = new Nexus();
  bullets = new ArrayList<Bullet>();
}

void draw() {
  // Background color white
  background(255);
  noStroke();
  
  // Display
  player.display();
  nexus.display();
  
  // Movement
  player.move(keys);
  
  PVector mouse = new PVector(mouseX, mouseY);
  fill(0);
  ellipse(mouse.x, mouse.y, 5, 5);
 
  // Framecount is the firerate (change to weapon's firerate later)
  if (mousePressed && frameCount % 20 == 0) {
    PVector playerV = new PVector(player.getX(), player.getY());
    PVector dir = PVector.sub(mouse, playerV);
    dir.normalize(); // Unit vector
    dir.mult(8); // Bullet speed
    
    // Add bullet to arraylist
    Bullet b = new Bullet(playerV, dir);
    bullets.add(b);
  }
  
  // Display and move bullets
  for (Bullet b : bullets) {
    b.display();
    b.move();
  }
}

void mouseClicked() {
}

void keyPressed() {
  keys[key] = true;
  System.out.println(key + " Pressed");
}

void keyReleased() {
  keys[key] = false; 
  System.out.println(key + " Released");
}

void saveHighscore() {
}

void gameOver() {
}

void restartGame() {
}