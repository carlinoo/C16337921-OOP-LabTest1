Table table;
ArrayList<Product> products;
ArrayList<Product> bill;

void setup() {
  size(800, 600);
  background(41);
  table = loadTable("cafe.csv", "header");
  products = new ArrayList<Product>();
  bill = new ArrayList<Product>();
  
  // We load the data
  loadData();
  
  // We display the products to the console
  printProducts();
  
  // We display the products to the screen
  displayProducts();
}


void draw() {
  printMenu();
  display_bill();
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
    products.get(i).display(px, 250);
  }
}



// This function will print the title to the screen and the menu
void printMenu() {
  fill(255);
  textSize(28);
  textAlign(CENTER);
  text("Cafe Rubis Till System", width/2, 35); 
  
  // Middle line
  strokeWeight(4);
  stroke(255);
  line(width/2, 50, width/2, height - 50);
  
  
  // The Bill menu
  noStroke();
  textAlign(CENTER);
  float size_x = (width - 100) - width/2;
  float size_y = (height - 100);
  fill(220);
  rect(width/2 + 50, 50, size_x, size_y);
  fill(0);

  textSize(16);
  text("Your Bill", width/2 + size_x/2 + 50, 80);
}



// If mouse is pressed, check which one prdouct has been clicked
void mousePressed() {
  for (Product p : products) {
    if (p.is_clicked()) {
      // If the product has been clicked, add it to the ArrayList
      println("Clicked", p.name);
      bill.add(p);
      return;
    }
  }
}


// This function will display the bill
void display_bill() {
  textAlign(LEFT);
  float padding = 15;
  float bill_y = 50;
  
  for (int i = 0; i < bill.size(); i++) {
   bill_y = (i + 1) * 40 + 50;
   fill(255);
   rect(width/2 + 50, bill_y, (width - 100) - width/2, 30);
  }
  
  // Print the total
  fill(0);
  text("Total:", width/2 + 50 + padding, bill_y + 60);
  textAlign(RIGHT);
  text(nf(total_bill_cost(), 0, 2), (width - 50 - padding), bill_y + 60);
}




// This will get the total price of the bill
float total_bill_cost() {
  float total = 0;
  
  for (Product b : bill) {
    total += b.price;
  }
  println(total);
  return total;
}