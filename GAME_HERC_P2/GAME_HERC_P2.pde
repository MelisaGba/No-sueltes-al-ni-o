import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import ddf.minim.*;

PFont   font,ff,num,num2;
PImage  jugador,menu,game,di,arb,ray;

int juego=0;
int score = 0;
int highScore=0;

ArrayList<Arbol> ar;
ArrayList<Rayo> ra;

//----------------AUDIO-----------

Minim music;
AudioPlayer music_1;


//---------------box2d------------

Box2DProcessing   box2d;

//-------------GAME---------------
Pantalla          ppal;
Herc              herc;


void setup() {
  
  size(700, 600);
   
   
  box2d     =  new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
   font      = loadFont("Basileus-25.vlw");
  ff        = loadFont("CaesarDressing-48.vlw");
  num       = loadFont("AgencyFB-Reg-48.vlw");
  num2       = loadFont("AgencyFB-Reg-30.vlw");
  
  jugador   = loadImage("agarra.png");
  game      = loadImage("cielo.png");
  menu      = loadImage("olimpo.jpg");
  di        = loadImage("dioses.png");
  arb       = loadImage("ar.png");
  ray      = loadImage("rayo.png");
  
  ppal      = new Pantalla();
  herc      = new Herc();
  
  
  ar = new ArrayList<Arbol>();
  ra = new ArrayList<Rayo>();
  
  music     = new Minim(this);
  music_1   = music.loadFile("distancia.mp3");
  music_1.setGain(2);
  music_1.loop();
}

void draw() {
  background(255);
  box2d.step();
  ppal.display();

 

  
}



void keyPressed() {
  ppal.teclado();
}
