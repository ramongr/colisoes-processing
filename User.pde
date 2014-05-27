class User {
  float x, y, mass, ang, spd, maxSpd;

  User(float x, float y, float mass) {

    this.x = x;
    this.y = y;
    this.spd = 1;
    this.maxSpd = 4;
    this.ang = 0;
    this.mass = mass;
  }

  void display() {

    fill(127);

    pushMatrix();
    //Make this point the origin of rotation
    translate(x, y);
    //Rotate in radians
    rotate(radians(ang));

    /*Since in this matrix (x,y) is the origin, the ellipse must be drawn here!*/
    ellipse(0, 0, mass, mass);
    fill(49);
    ellipse(0, 0-mass/4, mass/8, mass/8);
    popMatrix();
  }
  
  void move(boolean keyup, boolean keydown, boolean keyleft, boolean keyright, float x, float y) {
    
    println(x+" , "+y);
    if((this.x-mass) > 0 && (this.x+mass) < x && (this.y-mass) > 0 && (this.y+mass) < y){
      
      if (keyup) {
        this.y-=cos(radians(ang))*spd; 
        this.x+=sin(radians(ang))*spd;
        if (spd< maxSpd) spd+= 0.05;
      }
      
      if (keydown) {
        this.y+=cos(radians(ang))*spd; 
        this.x-=sin(radians(ang))*spd;
        
        if (spd< maxSpd) spd+= 0.05;
      }
      
      if(!keyup && !keydown && spd > 1) spd -=0.5;
      
      if (keyleft) ang = (ang-spd)%360;
      if (keyright) ang = (ang+spd)%360;
      
      println(spd);
    }else{
      
      if(!((this.x-mass) > 0)){
        
        this.x +=5;
      }else{
        
        this.x -=5;
      }
      
      if(!((this.y-mass) > 0)){
        
        this.y +=5;
      }else{
        
        this.y -=5;
      }
    }
  }

  void collision(float x, float y, float mass, float ang) {

    //As massas passam a ser raios
    mass = mass/2;
    float radius = this.mass/2;

    //"Normalização" do ângulo para simplificar contas
    float myang = (ang*-1)+this.ang;
    ang = (ang*-1)+ang;
    
    println(y+" , "+(y-mass));
    println(this.y+" , "+(this.y+radius));
    
    if ( (x-mass) < (this.x+radius) && (x+mass) > (this.x-radius)) {

      if ( (y+mass) > (this.y - radius) && y < (this.y-radius)) {
        //Put here bonus values
        println("Yes");
      }

      if ( y >= (this.y-radius) && (y-mass) <= (this.y+radius)) {
        //Put here bonus values
        println("No");
      }
    }
  }
}

