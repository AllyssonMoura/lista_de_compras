class Product {
  int? id;
  String? name;
  String? type;
  int? quantity;

  Product({
    this.id,
    this.name,
    this.type,
    this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'type': this.type,
      'quantity': this.quantity,
    };
  }

  static Product toObject(Map<String, dynamic> data) {
    return Product(
      id: data["id"],
      name: data["name"],
      type: data["type"],
      quantity: data["quantity"],
    );
  }
}
