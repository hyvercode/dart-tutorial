class Product {
  int? id;
  String name;
  double price;
  int stock;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  // Convert a Product object into a Map object
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'price': price, 'stock': stock};
  }

  // Extract a Product object from a Map object
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      stock: map['stock'],
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, stock: $stock}';
  }
}
