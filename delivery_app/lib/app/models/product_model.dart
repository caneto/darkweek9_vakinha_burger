import 'dart:convert';


class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;  

  ProductModel({
    this.id = 0,
    this.name = '',
    this.description = '',
    this.price = 0.0,
    this.image = '',
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}




    /* {
        "id": 1,
        "name": "X-Salada",
        "description": "Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese",
        "price": 15.0,
        "image": "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800"
    }, */