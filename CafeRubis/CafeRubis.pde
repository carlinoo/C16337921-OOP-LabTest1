Table table;
ArrayList<Product> products;
ArrayList<Product> bill;

void setup() {
  size(800, 600);
  background(41);
  table = loadTable("cafe.csv", "header");
  products = new ArrayList<Product>();
  
  loadData();
  
  //printProducts();
  
  displayProducts();
}


void draw() {
  printMenu();
}


// Function that loads all the data
void loadData() {
  for (TableRow tr : table.rows()) {
    products.add(new Product(tr));
  }
}


// This function will display all the products to the console
void printProducts() {
  for (Product p : products) {
    println(p.toString());
  }
}



// This function will display the products to the canvas
void displayProducts() {
  float padding = 10;
  
  // Loop through all products and display the boxes, name and prices
  // TODO : width should be dynamic
  for (int i = 0; i < products.size(); i++) {
    float px = map(i, 0, products.size(), 50, height - 50);
    //println(px);
    
    fill(170);
    rect(50, px, 250, 60);
    
    // Show the name
    textAlign(LEFT, CENTER);
    fill(255);
    text(products.get(i).name, 60, px + 30);
    
    // Show the price
    text(nf(products.get(i).price, 0 , 2), 260, px + 30);
  }
}



// This function will print the title to the screen
void printMenu() {
  textSize(28);
  textAlign(CENTER);
  text("Cafe Rubis Till System", width/2, 35); 
  
  // Middle line
  strokeWeight(4);
  stroke(255);
  line(width/2, 50, width/2, height - 50);
}