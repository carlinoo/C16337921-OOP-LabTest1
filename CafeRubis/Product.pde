class Product {
  String name;
  float price;
  
  Product(TableRow tr) {
    this.price = tr.getFloat("Price");
    this.name = tr.getString("Name");
  }
  
}