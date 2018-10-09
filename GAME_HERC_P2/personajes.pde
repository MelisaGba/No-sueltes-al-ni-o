class Herc{
  
  Body b;
  
  float x,y;
  float t;
  float alto;
  
  Herc(){
  this.x = 100;
  this.y =100;
  this.t = 200;
  
  //definir forma del objeto
      PolygonShape ps     = new PolygonShape();
      float wAjustado     = box2d.scalarPixelsToWorld(this.t/2);
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
     bd.type    = BodyType.DYNAMIC;
     bd.position.set(box2d.coordPixelsToWorld(this.x,this.y));
  
      //crear
      b = box2d.createBody(bd);
      b.createFixture(fd);  
      b.setActive(false);
 
  }
  
  void display(){
   
   Vec2 pos = box2d.getBodyPixelCoord(b);
      
   image(jugador,pos.x - t/2,pos.y - t/2,this.t,this.t);
   

}


  }
