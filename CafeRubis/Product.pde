class Product {
  String name;
  float price;
  
  Product(TableRow tr) {
    this.price = tr.getFloat("Price");
    this.name = tr.getString("Name");
  }
  
  
  // This function will return the formatted string of the product like "[name] costs [price]"
  String toString() {
    return this.name.concat(" costs ").concat(String.valueOf(this.price));
  }
  
  
  
  // This method will display the item at location x and y
  void display(float x, float y) {
    
    fill(170);
    rect(50, x, 250, 60);
    
    // Show the name
    textAlign(LEFT, CENTER);
    fill(255);
    text(this.name, 60, x + 30);
    
    // Show the price
    text(nf(this.price, 0 , 2), 260, x + 30);
  }
  
}