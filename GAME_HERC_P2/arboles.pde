
class Arbol{

 
  Body b;
  float x;
  float y;
  float t;
  float v;


  // Constructor
  Arbol() {
   
    this.x = width;//saldra siempre de la drecha
    this.y = 500;//posicion abajo
    this.t = random(200,400);//tamaño random
   
   //definir forma del objeto
      PolygonShape ps     = new PolygonShape();
      float wAjustado     = box2d.scalarPixelsToWorld(30);
      float hAjustado     = box2d.scalarPixelsToWorld(this.t/2);
      ps.setAsBox(wAjustado,hAjustado); 
   
     //fixture de objeto
       FixtureDef fd  = new FixtureDef();
       fd.shape       = ps;
       fd.density     = 1;
       fd.friction    = 0.3;
       fd.restitution = 0.5;
   
    // definir el body
    
     BodyDef bd = new BodyDef();
     bd.type    = BodyType.KINEMATIC;
     bd.position.set(box2d.coordPixelsToWorld(this.x,this.y));
  
      //crear
      b = box2d.createBody(bd);
      b.createFixture(fd);  
      
       
  }
  
  void display(){
 
    Vec2 pos=box2d.getBodyPixelCoord(b);
     image(arb,pos.x - 30,pos.y - this.t/2,200,this.t);       
     println(pos.x+" "+pos.y);
 
  }
    
  void SetVelocidad(float v){  
    b.setLinearVelocity(new Vec2(-v,0));  
  }


}
