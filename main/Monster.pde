class Monster{

  private  float x,y,mass;

  public Monster(float x, float y, float mass){

    this.x=x;
    this.y=y;
    this.mass=mass;
  }

  void display(){
    
    fill(199, 184, 18);
    ellipse(x, y, mass, mass);
    
    fill(0,0,0);
    textAlign(CENTER);
    textSize(14);
    text("?", x, y+(mass/4)+2);
  }

  void collision(float x, float y, float mass) {

    double d = Math.sqrt(Math.pow((this.x-x),2)+Math.pow((this.y-y),2));

    if( d<= ((this.mass/2)+mass/2)) println("Yes");
  }
}
