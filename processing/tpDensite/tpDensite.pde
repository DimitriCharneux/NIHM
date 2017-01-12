//globally 
//declare the min and max variables that you need in parseInfo 
float minX, maxX;
float minY, maxY;
int totalCount; // total number of places 
int minPopulation, maxPopulation;
int minSurface, maxSurface;
int minAltitude, maxAltitude; 
int minDensiteToDisplay = 100;
City lastPrintedName;
City selectedCity = null;

HScrollbar bar;

// and the tables in which the city coordinates will be stored 
City cities[];

void setup() {
  size(1200,700); 
  bar = new HScrollbar(850, 75, 300, 16, 1);
  
  readData();
}

void draw(){
  clear();
  background(255);
  for (int i = 0 ; i < totalCount ; i++)
    if(cities[i] != null && cities[i].population > minDensiteToDisplay)
      cities[i].draw();
  if(lastPrintedName != null){
    lastPrintedName.afficheNom();
  }
  
  
  //Affichage de la ville selectionné
  textSize(14);
  fill(0,0,0);
  if(selectedCity != null){
    text("Ville selectionné : " + selectedCity.name, 840, 125);
    text("Population : " + selectedCity.population + " habitants", 850, 150);
    text("Densité : " + selectedCity.densite + " habitants/km^2", 850, 175);
    text("Surface : " + selectedCity.surface + " km^2", 850, 200);
    text("Altitude : " + selectedCity.altitude + " m", 850, 225);
  } else {
    text("Pas de ville selectionné ", 840, 125);
  }
  
  //scrollbar
  bar.update();
  bar.display();
  println(bar.getPos());
  minDensiteToDisplay = (int)(bar.getPos() * 100000);
  
  
  //Affichage de la légende
  stroke(0,0,0);
  noFill();
  rect(825,25,350,275,1);
  
  textSize(14);
  fill(0,0,0);
  text("Afficher les populations supérieures à " + minDensiteToDisplay, 840, 50);
}


void mouseMoved() {
  //println("MouseX : " + mouseX + ", MouseY : " + mouseY);
  City tmp = pick(mouseX,mouseY);
  if(tmp != null){
    if(lastPrintedName == null){
      tmp.isSelected = true;
      lastPrintedName = tmp;
      println(tmp.name);
    } else if(lastPrintedName != tmp){
      lastPrintedName.isSelected = false;
      tmp.isSelected = true;
      lastPrintedName = tmp;
      println(tmp.name);
    }
  } else {
    if(lastPrintedName != null){
      lastPrintedName.isSelected = false;
      lastPrintedName = null;
    }
  }
}

void mouseClicked() {
  City tmp = pick(mouseX,mouseY);
  if(tmp != null){
    selectedCity = tmp;
  } else {
    selectedCity = null;
  }
}

void readData() {
  String[] lines = loadStrings("http://www.cs.toronto.edu/~fchevali/fanny/masterIVI/villes.tsv");
  parseInfo(lines[0]);
  cities = new City[totalCount];
  
  for (int i = 2 ; i < totalCount ; ++i) {
    String[] columns = split(lines[i], TAB);
    cities[i-2] = new City();
    cities[i-2].postalcode = int (columns[0]);
    cities[i-2].x = float (columns[1]);
    cities[i-2].y = float (columns[2]);
    cities[i-2].population = float (columns[5]);
    cities[i-2].surface = float (columns[6]);
    cities[i-2].altitude = float (columns[7]);
    cities[i-2].name = (columns[4]);
    cities[i-2].densite = cities[i-2].population / cities[i-2].surface;
  }
}

void parseInfo(String line) { 
  String infoString = line.substring(2); // remove the # 
  String[] infoPieces = split(infoString, ',');
  totalCount = int(infoPieces[0]);
  minX = float(infoPieces[1]);
  maxX = float(infoPieces[2]);
  minY = float(infoPieces[3]);
  maxY = float(infoPieces[4]);
  minPopulation = int(infoPieces[5]);
  maxPopulation = int(infoPieces[6]);
  minSurface = int(infoPieces[7]);
  maxSurface = int(infoPieces[8]);
  minAltitude = int(infoPieces[9]);
  maxAltitude = int(infoPieces[10]); 
}

City pick(int px, int py){
  for(int i = cities.length -1; i>=0; i-- ){
    if(cities[i]!=null && cities[i].population > minDensiteToDisplay && cities[i].contains(px,py)){
      return cities[i];
    }
  }
  return null;
}

float mapX(float x) {
  return map(x, minX, maxX, 0, 700);
}

float mapY(float y) {
  return map(y, maxY, minY, 0, 700);
}