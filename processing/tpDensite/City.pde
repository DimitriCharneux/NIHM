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
      R=248;
      G=248;
      B=152;
    } else if(densite < 15){
      R=239;
      G=240;
      B=112;
    } else if(densite < 30){
      R=240;
      G=231;
      B=64;
    } else if(densite < 50){
      R=239;
      G=192;
      B=40;
    } else if(densite < 80){
      R=241;
      G=152;
      B=32;
    } else if(densite < 110){
      R=240;
      G=112;
      B=39;
    } else if(densite < 150){
      R=243;
      G=94;
      B=52;
    } else if(densite < 250){
      R=241;
      G=72;
      B=41;
    } else if(densite < 1000){
      R=255;
      G=48;
      B=32;
    } else if(densite < 2000){
      R=248;
      G=21;
      B=15;
    } else if(densite < 4000){
      R=232;
      G=16;
      B=5;
    } else if(densite < 8000){
      R=208;
      G=5;
      B=0;
    } else if(densite < 15000){
      R=168;
      G=5;
      B=0;
    } else {
      R=144;
      G=0;
      B=0;
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