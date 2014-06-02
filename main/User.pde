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
      
    }else{
      
      if(!((this.x-mass) > 0)){
        
        this.x +=5;
        this.ang = 270-this.ang;
        println("1");
      }else{
        
        this.x -=5;
        this.ang = 270-this.ang;
        println("2");
      }
      
      if(!((this.y-mass) > 0)){
        
        this.y +=5;
        this.ang = 180-this.ang;
        println("3");
      }else{
        
        this.y -=5;
        this.ang = 180-this.ang;
        println("4");
      }
    }
  }

  void collision(float x, float y, float mass, float ang) {

    //As massas passam a ser raios
    mass = mass/2;
    float radius = this.mass/2;
    double d = Math.sqrt(Math.pow((this.x-x),2)+Math.pow((this.y-y),2));

    //"Normalização" do ângulo para simplificar contas
    float myang = (ang*-1)+this.ang;
    ang = (ang*-1)+ang;
    
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

    if( d<= ((this.mass/2)+mass/2)) this.ang = (this.ang-180)%360;
  }
}

