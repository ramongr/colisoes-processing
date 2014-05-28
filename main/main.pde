float x,y,mass;
//Player 1 keys
boolean keyupp1 = false;
boolean keydownp1 = false;
boolean keyleftp1 = false;
boolean keyrightp1 = false;
//PLayer 2 keys
boolean keyupp2 = false;
boolean keydownp2 = false;
boolean keyleftp2 = false;
boolean keyrightp2 = false;

User myuser, otheruser;
Monster monster, monster2;

void setup(){
  x = 640;
  y = 480;
  size(640,480);
  
  mass = 32;
  
  myuser = new User(x/2, y/2, mass);
  otheruser = new User(x/2, (y/2)-75, mass);
  monster = new Monster((x/2)-75, y/2, mass/2);
  monster2 = new Monster((x/2)-90, (y/2)+10, mass/2);
}

void draw(){
  background(255);
  myuser.move(keyupp1,keydownp1,keyleftp1,keyrightp1,x,y);
  otheruser.move(keyupp2,keydownp2,keyleftp2,keyrightp2,x,y);
  
  myuser.collision(otheruser.x,otheruser.y,otheruser.mass, otheruser.ang);
  
  otheruser.display();
  myuser.display();
  monster.display();
  monster2.display();
}

void keyPressed() {
  if (key == CODED) {
    //Keys for Player 1
    if (keyCode == UP) keyupp1 = true;
    if (keyCode == DOWN) keydownp1 = true;
    if (keyCode == LEFT) keyleftp1 = true;
    if (keyCode == RIGHT) keyrightp1 = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    
    //Keys for Player 1
    if (keyCode == UP) keyupp1 = false;
    if (keyCode == DOWN) keydownp1 = false;
    if (keyCode == LEFT) keyleftp1 = false;
    if (keyCode == RIGHT) keyrightp1 = false;
    
  }
}

