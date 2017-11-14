class Product {
  String name;
  float price;
  float y_pos;
  
  Product(TableRow tr) {
    this.price = tr.getFloat("Price");
    this.name = tr.getString("Name");
  }
  
  
  // This function will return the formatted string of the product like "[name] costs [price]"
  String toString() {
    return this.name.concat(" costs ").concat(String.valueOf(this.price));
  }
  
  
  
  // This method will display the item at location x and y
  void display(float y, float x) {
    // When we display, we set the x_pos variable
    this.y_pos = y;
    
    fill(170);
    rect(50, y, 250, 60);
    
    // Show the name
    textAlign(LEFT, CENTER);
    fill(255);
    text(this.name, 60, y + 30);
    
    // Show the price
    text(nf(this.price, 0 , 2), 260, y + 30);
  }
  
  
  
  // This will return of the box of the Product is clicked
  boolean is_clicked() {
    // Mouse is in between y range
    if (mouseY > this.y_pos && mouseY < this.y_pos + 60) {
      // Mouse is in between x range
      if (mouseX > 50 && mouseX < 300) {
        return true;
      }
    }
    return false;
  }
  
}