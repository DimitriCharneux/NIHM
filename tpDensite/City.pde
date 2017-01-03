class City {
  int postalcode;
  String name;
  float x; 
  float y; 
  float population;
  float surface;
  float altitude;
  float densite;
  int diametre = 3;
  boolean isSelected = false;

  void draw(){

    /* densite src www.cartesfrance.fr/geographie/cartes-population/carte-densite-population-2009.html */
    noStroke();
    float R=0,G=0,B=0;
    if(densite < 5){
      R=255;
      G=255;
      B=107;
    } else if(densite < 15){
      R=255;
      G=234;
      B=115;
    } else if(densite < 30){
      R=255;
      G=210;
      B=125;
    } else if(densite < 50){
      R=255;
      G=203;
      B=96;
    } else if(densite < 80){
      R=239;
      G=155;
      B=15;
    } else if(densite < 110){
      R=255;
      G=127;
      B=0;
    } else if(densite < 150){
      R=237;
      G=27;
      B=16;
    } else if(densite < 250){
      R=223;
      G=109;
      B=20;
    } else if(densite < 500){
      R=244;
      G=102;
      B=27;
    } else if(densite < 1000){
      R=231;
      G=62;
      B=1;
    } else if(densite < 2000){
      R=255;
      G=0;
      B=0;
    } else if(densite < 4000){
      R=187;
      G=11;
      B=11;
    } else if(densite < 8000){
      R=150;
      G=11;
      B=15;
    } else if(densite < 15000){
      R=110;
      G=11;
      B=20;
    } else {
      R=109;
      G=7;
      B=26;
    }
    
    fill(R,G,B);
    ellipse((int) mapX(this.x), (int) mapY(this.y), diametre,diametre);
    
    
    /* altitude */
    /*noStroke();
    int valeur =(int) (255 - (this.altitude/maxAltitude) *255);
    fill(valeur,valeur,valeur);
    int taille = 2+(int)((this.altitude/maxAltitude) * 20);
    ellipse((int) mapX(this.x), (int) mapY(this.y), taille, taille);*/
  }
  
  void afficheNom(){
    if(isSelected){
      textSize(12);
      textAlign(LEFT, TOP);
      fill(255,255,255);
      rect((int) mapX(this.x) + diametre/2 - 2, (int) mapY(this.y)-10, textWidth(name) +4 , 20);
      fill(0,0,0);
      text(name, (int) mapX(this.x) + diametre/2, (int) mapY(this.y)-7);
    }
  }
  
  boolean contains(int px, int py) {
  // Comme nous dessinons un cercle, on utilise ici la distance 
// entre (px, py) et le centre du cercle, 
// et on ajoute un pixel supplémentaire pour faciliter 
// la sélection à la souris 
    return dist(mapX(x), mapY(y), px, py) <= diametre/2 + 1; 
  }
  
}