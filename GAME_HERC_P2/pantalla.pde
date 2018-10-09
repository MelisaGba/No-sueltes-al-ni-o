

class Pantalla {

  int n;
 
  float x1,x2,y,w,h;
  Body b; 
  
 Pantalla() {

   x1 = 0;
   x2 = game.width;

}
  void inicio() {
    image(menu, 0, 0);
    textFont(font);
    fill(217, 132, 76);
    rect(250, height/2+100, 200, 30);
    fill(244, 218, 66);
    text("Click para comenzar", 255, 423);
    if (mousePressed) { 
      n=1;
    }
  }
  void instruccion() {
    image(di, 0, 0);
    fill(244, 218, 66);
    textFont(ff);
    text("instrucciones", 200, 100);
    fill(217, 132, 76, 130);
    noStroke();
    rect(100, 150, 500, 400);
    textFont(num2);
    fill(255);
    text("Esquiva los obstaculos que aparecen en el juego presionando la tecla 'Q' para elevar a tu personaje, y la tecla 'E' para hacer que baje.Evita tocar los bordes de la pantalla o perderas!", 220, 220,300,450);
    text("Presiona 'V' para pasar al juego",220,490);
    if ((key=='v'|| key=='V')) {      
      herc.b.setActive(true);
      n=2;
    }
  }


  void juego() {
    
    music_1.setGain(-1);
    
    image(game, x1, 0);
    image(game, x2, 0);
    
    x1 -=6;
    x2 -=6;
    
    if (x1+game.width <= 0) 
       x1 = x2+game.width;//reinicia el fondo
    if (x2+game.width <= 0) 
       x2 = x1+game.width;//reinicia el fondo
      
      fill(255);
      textFont(num);
      text(""+score, 600, 100);
      
      herc.display();
      
      
      for(int i=0;i<ar.size();i++){
          Arbol ab = ar.get(i);
          ab.display();  
  
     
      }
 
     if(frameCount%356 == 0){
         ar.add(new Arbol());
         Arbol ab = ar.get(ar.size()-1);
         ab.SetVelocidad(6);
         
         
     }
     
     for(int i=0;i<ra.size();i++){
          Rayo ray = ra.get(i);
          ray.display();     
        
      }
 
     if(frameCount%630 == 0){
         ra.add(new Rayo());
         Rayo ray = ra.get(ra.size()-1);
         ray.SetVelocidad(6);
     }
     
 if (x1+ar.size() >= 0) 
 score++;
    highScore=max(score,highScore);
         
 if (x1+jugador.width <= 0-700) n=3;
 if (x1+jugador.height <= 0-600) n=3;
  }





  void gameover() {
    image(di, 0, 0);
    fill(244, 218, 66);
    textFont(ff);
    text("Ultima punctuación:"+highScore, 200, 200);
    text("PARA SALIR PULSE X", 200, width/2);
    if ((key=='x' || key=='X')) {
      exit();
      music_1.loop();
     
    }
  }


  void display() {


    switch(this.n) {
    case 0:
      inicio();
      break;
    case 1:
      instruccion();

      break;
    case 2:

      juego();
      
      break;

    case 3:
      gameover();
      break;
    }
  }


  void teclado() {


    if ((key=='q' || key=='Q')) {
      box2d.setGravity(0, 10);
    }

    if ((key=='e' || key=='E')) {
      box2d.setGravity(0, -10);
    }
  }
 
}
