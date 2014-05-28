class Monster{

  private  float x,y,mass;

  public Monster(float x, float y, float mass){

    this.x=x;
    this.y=y;
    this.mass=mass;
  }

  void display(){
    
    fill(255,255,255);
    ellipse(x, y, mass, mass);
    
    fill(0,0,0);
    textAlign(CENTER);
    textSize(14);
    text("?", x, y+(mass/4)+2);
  }

  void collision(float x, float y, float mass, float ang) {

    //As massas passam a ser raios
    mass = mass/2;
    float radius = this.mass/2;
    
    println(y+" , "+(y-mass));
    println(this.y+" , "+(this.y+radius));
    
    if ( (x-mass) < (this.x+radius) && (x+mass) > (this.x-radius)) {

      if ( (y+mass) > (this.y - radius) && y < (this.y-radius)) {
        //Put here bonus values
        println("Yes");
      }

      if ( y >= (this.y-radius) && (y-mass) <= (this.y+radius)) {
        //Put here bonus values
        println("Yes");
      }
    }
  }
}
