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
    /* densité
    ellipse((int) mapX(this.x), (int) mapY(this.y), this.density/100,this.density/100);
    */
    
    /* densite 2 */
    noStroke();
    fill( 255 - ((this.population/maxPopulation) *255),
    255 - ((this.population/maxPopulation) *255),
    255 - ((this.population/maxPopulation) *255));
    ellipse((int) mapX(this.x), (int) mapY(this.y), 
    (this.population/maxPopulation) * 100,(this.population/maxPopulation) * 100);
    
    
    /* altitude */
    /*noStroke();
    fill((this.altitude/maxAltitude) *255,0,0);
    ellipse((int) mapX(this.x), (int) mapY(this.y), 1,1);*/
  }
}