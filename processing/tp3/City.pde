class City {
  int postalcode;
  String name;
  float x; 
  float y; 
  float population;
  float density;
  float surface;
  float altitude;
  int diametre;
  boolean isSelected = false;

  void draw(){
    /* population*/
    /*int pop = (int)((population / maxPopulation) * 200);
    ellipse((int) mapX(this.x), (int) mapY(this.y), pop,pop);*/
    
    
    /* densité*/
    if(isSelected)
      fill(255,0,0);
    else
      fill(255,255,255);
    diametre = (int)(this.density/100);
    ellipse((int) mapX(this.x), (int) mapY(this.y), diametre,diametre);
    
    afficheNom();
    /* densite 2 */
    /*noStroke();
    fill( 255 - ((this.population/maxPopulation) *255),
    255 - ((this.population/maxPopulation) *255),
    255 - ((this.population/maxPopulation) *255));
    ellipse((int) mapX(this.x), (int) mapY(this.y), 
    (this.population/maxPopulation) * 100,(this.population/maxPopulation) * 100);*/
    
    
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