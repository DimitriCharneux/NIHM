class City {
  int postalcode;
  String name;
  float x; 
  float y; 
  float population;
  float density;
  float surface;
  float altitude;

  void draw(){
    /* densité*/
    ellipse((int) mapX(this.x), (int) mapY(this.y), this.density/100,this.density/100);
    
    
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
}