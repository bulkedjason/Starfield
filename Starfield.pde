class Particle{
  double myX,myY, mySpeed;
  int myAngle;
  color myColor;
  Particle(){
    myX=300;
    myY=300;
    myAngle=(int)(Math.random()*8*Math.PI);
    mySpeed=(Math.random()*10);
    myColor=color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  void show(){
    fill(myColor);
    ellipse((float)myX,(float)myY,10,10);
  }
  void move(){
    myX=myX+mySpeed*cos((float)myAngle);
    myY=myY+mySpeed*sin((float)myAngle);
    if(myX<0||myX>600){
      myX=300;
      myY=300;
    }
    if(myY<0||myY>600){
      myY=300;
      myX=300;
    }
  }
}
class OddballParticle extends Particle{
  OddballParticle(){
    myX=300;
    myY=300;
    myAngle=0;
    mySpeed=1;
    myColor=color((int)(Math.random()*256),0,(int)(Math.random()*256));
  }
   void show(){
    fill(myColor);
    ellipse((float)myX,(float)myY,100,100);
  }
  void move(){
    myAngle+=mySpeed;
    myX=300+200*cos((float)myAngle);
    myY=300+200*sin((float)myAngle);
  }
}
Particle[]bob=new Particle[1000];
void setup(){
  size(600,600);
  noStroke();
  for(int i=0;i<bob.length;i++){
    bob[i]=new Particle();
  }
  bob[0]=new OddballParticle();
}
double hi=2;
void draw(){
  background(0,0,20);
  for(int i=0;i<bob.length;i++){
    bob[i].move();
    if(i!=0){
      bob[i].show();
    }
  }
  fill(255,100);
  ellipse(300, 300, 120+(float)hi, 120+(float)hi);
  fill(255);
  ellipse(300, 300, 100+(float)hi/10, 100+(float)hi/10);
  fill(0);
  ellipse(300, 300, 90, 90);
  bob[0].show();
  hi=hi*1.1;
  if(hi>700){
    hi=2;
  }
}
