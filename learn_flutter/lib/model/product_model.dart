import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String category;
  @HiveField(7)
  final double rating;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'description': description,
      'category': category,
      'rating': rating,
    };
  }
}
