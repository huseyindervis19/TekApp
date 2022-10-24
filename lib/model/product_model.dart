class ProductModel {
  String name = '',
      image = '',
      description = '',
      color = '',
      sized = '',
      price = '';

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.color,
      required this.sized});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = map['color'];
    sized = map['sized'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
    };
  }
}
