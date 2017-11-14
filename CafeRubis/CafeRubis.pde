Table table;
ArrayList<Product> products;
ArrayList<Product> bill;

void setup() {
  size(800, 600);
  background(41);
  table = loadTable("cafe.csv", "header");
  products = new ArrayList<Product>();
  
  loadData();
}


void draw() {
  
}


// Function that loads all the data
void loadData() {
  for (TableRow tr : table.rows()) {
    products.add(new Product(tr));
    println(products.get(0).name);
  }
}