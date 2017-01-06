class City {
  int postalcode;
  String name;
  float x; 
  float y; 
  float population;
  float surface;
  float altitude;
  float densite;
  int diametre = 5;
  boolean isSelected = false;

  void draw(){


    
    
    /* altitude */
    noStroke();
    float valeur =this.altitude/maxAltitude;
    
    if(valeur < 0.125){
      fill(255,255,229);
    }else if(valeur < 0.250){
      fill(255,247,188);  
    }else if(valeur < 0.375){
      fill(254,227,145);    
    }else if(valeur < 0.500){
      fill(254,196,79);
    }else if(valeur < 0.625){
      fill(254,153,41);
    }else if(valeur < 0.750){
      fill(236,112,20);
    }else if(valeur < 0.975){
      fill(204,76,2);
    }else{
      fill(140,45,4);
    }

    ellipse((int) mapX(this.x), (int) mapY(this.y), diametre, diametre);
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