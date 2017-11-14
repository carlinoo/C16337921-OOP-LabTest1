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
  
}