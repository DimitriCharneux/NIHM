//globally 
//declare the min and max variables that you need in parseInfo 
float minX, maxX;
float minY, maxY;
int totalCount; // total number of places 
int minPopulation, maxPopulation;
int minSurface, maxSurface;
int minAltitude, maxAltitude; 
int minDensiteToDisplay = 100;
float multiplicateur = 0.2;
City lastPrintedName;

// and the tables in which the city coordinates will be stored 
City cities[];

void setup() {
  size(800,800); 
  readData();
}

void draw(){
  clear();
  if(keyPressed){
    if(key == '+')
        minDensiteToDisplay += minDensiteToDisplay * multiplicateur;
    if(key == '-')
      if((int)(minDensiteToDisplay - minDensiteToDisplay * multiplicateur) >10)
        minDensiteToDisplay -= minDensiteToDisplay * multiplicateur;
  }
  
  
  background(255);
  for (int i = 0 ; i < totalCount ; i++)
    if(cities[i] != null && cities[i].densite > minDensiteToDisplay)
      cities[i].draw();
  if(lastPrintedName != null){
    lastPrintedName.afficheNom();
  }
  textSize(32);
  fill(0,0,0);
  text("Afficher les populations supérieures à " + minDensiteToDisplay, 20, 750);
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
    if(cities[i]!=null && cities[i].densite > minDensiteToDisplay && cities[i].contains(px,py)){
      return cities[i];
    }
  }
  return null;
}

float mapX(float x) {
  return map(x, minX, maxX, 0, 800);
}

float mapY(float y) {
  return map(y, maxY, minY, 0, 800);
}